-- ============================================================
-- Present App — Initial Schema Migration
-- Tables, RLS policies, RPCs. Apply via: supabase db push
-- ============================================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE user_role AS ENUM ('adult', 'young');
CREATE TYPE subscription_status AS ENUM ('trial', 'premium', 'free');
CREATE TYPE member_status AS ENUM ('active', 'invited', 'removed');
CREATE TYPE member_role AS ENUM ('admin', 'adult', 'young');
CREATE TYPE session_status AS ENUM ('starting', 'active', 'completed', 'cancelled');
CREATE TYPE ritual_category AS ENUM ('meal', 'outdoor', 'indoor', 'creative', 'reading');

-- ── users ────────────────────────────────────────────────────
CREATE TABLE public.users (
  id                  uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  display_name        text NOT NULL DEFAULT '' CHECK (char_length(display_name) <= 60),
  avatar_url          text,
  role                user_role NOT NULL DEFAULT 'adult',
  locale              text NOT NULL DEFAULT 'en',
  subscription_status subscription_status NOT NULL DEFAULT 'trial',
  trial_ends_at       timestamptz,
  notification_prefs  jsonb NOT NULL DEFAULT '{"rituals": true, "streak": true, "family": true}'::jsonb,
  created_at          timestamptz NOT NULL DEFAULT now(),
  updated_at          timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

CREATE POLICY "users_select_own" ON public.users FOR SELECT USING (id = auth.uid());
CREATE POLICY "users_update_own" ON public.users FOR UPDATE USING (id = auth.uid()) WITH CHECK (id = auth.uid());
CREATE POLICY "users_insert_own" ON public.users FOR INSERT WITH CHECK (id = auth.uid());

-- ── family_groups ────────────────────────────────────────────
CREATE TABLE public.family_groups (
  id                uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  name              text NOT NULL CHECK (char_length(name) BETWEEN 1 AND 60),
  admin_user_id     uuid NOT NULL REFERENCES public.users(id),
  subscription_plan subscription_status NOT NULL DEFAULT 'trial',
  revenuecat_id     text,
  invite_code       text NOT NULL UNIQUE DEFAULT upper(substring(uuid_generate_v4()::text, 1, 8)),
  created_at        timestamptz NOT NULL DEFAULT now(),
  updated_at        timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.family_groups ENABLE ROW LEVEL SECURITY;

CREATE POLICY "family_groups_select_members" ON public.family_groups FOR SELECT
  USING (id IN (SELECT family_group_id FROM public.family_members WHERE user_id = auth.uid() AND status = 'active'));
CREATE POLICY "family_groups_insert_own" ON public.family_groups FOR INSERT WITH CHECK (admin_user_id = auth.uid());
CREATE POLICY "family_groups_update_admin" ON public.family_groups FOR UPDATE USING (admin_user_id = auth.uid());

-- ── family_members ───────────────────────────────────────────
CREATE TABLE public.family_members (
  id              uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id         uuid NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  family_group_id uuid NOT NULL REFERENCES public.family_groups(id) ON DELETE CASCADE,
  status          member_status NOT NULL DEFAULT 'active',
  role            member_role NOT NULL DEFAULT 'adult',
  last_seen_at    timestamptz,
  joined_at       timestamptz NOT NULL DEFAULT now(),
  UNIQUE(user_id, family_group_id)
);

ALTER TABLE public.family_members ENABLE ROW LEVEL SECURITY;

CREATE POLICY "family_members_select" ON public.family_members FOR SELECT
  USING (family_group_id IN (SELECT family_group_id FROM public.family_members fm WHERE fm.user_id = auth.uid() AND fm.status = 'active'));
CREATE POLICY "family_members_insert" ON public.family_members FOR INSERT
  WITH CHECK (
    family_group_id IN (SELECT id FROM public.family_groups WHERE admin_user_id = auth.uid())
    OR user_id = auth.uid()
  );
CREATE POLICY "family_members_update" ON public.family_members FOR UPDATE
  USING (user_id = auth.uid() OR family_group_id IN (SELECT id FROM public.family_groups WHERE admin_user_id = auth.uid()));

-- ── rituals ──────────────────────────────────────────────────
CREATE TABLE public.rituals (
  id                uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  family_group_id   uuid REFERENCES public.family_groups(id) ON DELETE CASCADE,
  title_i18n        jsonb NOT NULL,
  description_i18n  jsonb,
  category          ritual_category NOT NULL DEFAULT 'indoor',
  duration_min      integer NOT NULL DEFAULT 30,
  time_of_day       text[] NOT NULL DEFAULT '{}',
  season            text[] NOT NULL DEFAULT '{}',
  is_system         boolean NOT NULL DEFAULT false,
  is_active         boolean NOT NULL DEFAULT true,
  created_at        timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.rituals ENABLE ROW LEVEL SECURITY;

CREATE POLICY "rituals_select" ON public.rituals FOR SELECT
  USING (is_system = true OR family_group_id IN (SELECT family_group_id FROM public.family_members WHERE user_id = auth.uid() AND status = 'active'));
CREATE POLICY "rituals_insert_admin" ON public.rituals FOR INSERT
  WITH CHECK (is_system = false AND family_group_id IN (SELECT id FROM public.family_groups WHERE admin_user_id = auth.uid()));

-- ── present_sessions ─────────────────────────────────────────
CREATE TABLE public.present_sessions (
  id               uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  family_group_id  uuid NOT NULL REFERENCES public.family_groups(id) ON DELETE CASCADE,
  started_by       uuid NOT NULL REFERENCES public.users(id),
  ritual_id        uuid REFERENCES public.rituals(id),
  status           session_status NOT NULL DEFAULT 'starting',
  started_at       timestamptz NOT NULL DEFAULT now(),
  ended_at         timestamptz,
  duration_minutes integer,
  score_earned     integer,
  created_at       timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.present_sessions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "sessions_family_isolation" ON public.present_sessions FOR ALL
  USING (family_group_id IN (SELECT family_group_id FROM public.family_members WHERE user_id = auth.uid() AND status = 'active'));

-- ── session_participants ─────────────────────────────────────
CREATE TABLE public.session_participants (
  id                uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  session_id        uuid NOT NULL REFERENCES public.present_sessions(id) ON DELETE CASCADE,
  user_id           uuid NOT NULL REFERENCES public.users(id),
  joined_at         timestamptz NOT NULL DEFAULT now(),
  left_at           timestamptz,
  distraction_count integer NOT NULL DEFAULT 0,
  last_check_in     timestamptz DEFAULT now(),
  UNIQUE(session_id, user_id)
);

ALTER TABLE public.session_participants ENABLE ROW LEVEL SECURITY;

CREATE POLICY "participants_select" ON public.session_participants FOR SELECT
  USING (session_id IN (SELECT id FROM public.present_sessions WHERE family_group_id IN (SELECT family_group_id FROM public.family_members WHERE user_id = auth.uid() AND status = 'active')));
CREATE POLICY "participants_insert_self" ON public.session_participants FOR INSERT WITH CHECK (user_id = auth.uid());
CREATE POLICY "participants_update_self" ON public.session_participants FOR UPDATE USING (user_id = auth.uid());

-- ── diary_entries ────────────────────────────────────────────
CREATE TABLE public.diary_entries (
  id              uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  session_id      uuid NOT NULL REFERENCES public.present_sessions(id) ON DELETE CASCADE,
  family_group_id uuid NOT NULL REFERENCES public.family_groups(id) ON DELETE CASCADE,
  created_by      uuid NOT NULL REFERENCES public.users(id),
  emoji           text,
  note            text CHECK (char_length(note) <= 140),
  photo_url       text,
  created_at      timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.diary_entries ENABLE ROW LEVEL SECURITY;

CREATE POLICY "diary_family_isolation" ON public.diary_entries FOR ALL
  USING (family_group_id IN (SELECT family_group_id FROM public.family_members WHERE user_id = auth.uid() AND status = 'active'));

-- ── fcm_tokens ───────────────────────────────────────────────
CREATE TABLE public.fcm_tokens (
  id         uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id    uuid NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  token      text NOT NULL,
  platform   text NOT NULL CHECK (platform IN ('ios', 'android')),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE(user_id, token)
);

ALTER TABLE public.fcm_tokens ENABLE ROW LEVEL SECURITY;
CREATE POLICY "fcm_tokens_own" ON public.fcm_tokens FOR ALL USING (user_id = auth.uid());

-- ── audit_log ────────────────────────────────────────────────
CREATE TABLE public.audit_log (
  id          uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id     uuid REFERENCES public.users(id),
  action      text NOT NULL,
  metadata    jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at  timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.audit_log ENABLE ROW LEVEL SECURITY;
CREATE POLICY "audit_log_select_own" ON public.audit_log FOR SELECT USING (user_id = auth.uid());
CREATE POLICY "audit_log_insert_service" ON public.audit_log FOR INSERT WITH CHECK (auth.role() = 'service_role');

-- ── Triggers ─────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION update_updated_at() RETURNS trigger AS $$
BEGIN NEW.updated_at = now(); RETURN NEW; END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER users_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER family_groups_updated_at BEFORE UPDATE ON public.family_groups FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE OR REPLACE FUNCTION public.handle_new_user() RETURNS trigger AS $$
BEGIN
  INSERT INTO public.users (id, display_name, trial_ends_at)
  VALUES (NEW.id, COALESCE(NEW.raw_user_meta_data->>'full_name', split_part(NEW.email, '@', 1)), now() + interval '21 days')
  ON CONFLICT (id) DO NOTHING;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ── Indexes ──────────────────────────────────────────────────
CREATE INDEX idx_family_members_user ON public.family_members(user_id, status);
CREATE INDEX idx_family_members_group ON public.family_members(family_group_id, status);
CREATE INDEX idx_sessions_family ON public.present_sessions(family_group_id, status);
CREATE INDEX idx_sessions_started_at ON public.present_sessions(started_at DESC);
CREATE INDEX idx_participants_session ON public.session_participants(session_id);
CREATE INDEX idx_diary_family ON public.diary_entries(family_group_id, created_at DESC);
CREATE INDEX idx_fcm_tokens_user ON public.fcm_tokens(user_id);

-- ── RPC: get_weekly_score ────────────────────────────────────
-- Called from: lib/features/home/presentation/home_screen.dart
--              lib/features/dashboard/presentation/dashboard_screen.dart
CREATE OR REPLACE FUNCTION public.get_weekly_score(p_user_id uuid)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
  v_family_id   uuid;
  v_this_week   int := 0;
  v_last_week   int := 0;
  v_total_fams  int := 0;
  v_worse_fams  int := 0;
BEGIN
  SELECT family_group_id INTO v_family_id
  FROM public.family_members WHERE user_id = p_user_id AND status = 'active' LIMIT 1;

  IF v_family_id IS NULL THEN
    RETURN jsonb_build_object('score', 0, 'delta', 0, 'percentile', 0);
  END IF;

  SELECT COALESCE(SUM(score_earned), 0) INTO v_this_week
  FROM public.present_sessions
  WHERE family_group_id = v_family_id AND status = 'completed' AND started_at >= date_trunc('week', now());

  SELECT COALESCE(SUM(score_earned), 0) INTO v_last_week
  FROM public.present_sessions
  WHERE family_group_id = v_family_id AND status = 'completed'
    AND started_at >= date_trunc('week', now()) - interval '7 days'
    AND started_at <  date_trunc('week', now());

  SELECT COUNT(DISTINCT family_group_id) INTO v_total_fams
  FROM public.present_sessions WHERE status = 'completed' AND started_at >= date_trunc('week', now());

  SELECT COUNT(*) INTO v_worse_fams FROM (
    SELECT family_group_id, SUM(score_earned) AS fam_score
    FROM public.present_sessions
    WHERE status = 'completed' AND started_at >= date_trunc('week', now())
    GROUP BY family_group_id
    HAVING SUM(score_earned) < v_this_week
  ) sub;

  RETURN jsonb_build_object(
    'score', v_this_week,
    'delta', v_this_week - v_last_week,
    'percentile', CASE WHEN v_total_fams > 0 THEN 100 - LEAST(100, ROUND((v_worse_fams::numeric / v_total_fams) * 100)) ELSE 0 END
  );
END;
$$;

-- ── RPC: get_member_scores_this_week ─────────────────────────
-- Called from: lib/features/family/presentation/family_screen.dart
CREATE OR REPLACE FUNCTION public.get_member_scores_this_week(p_family_group_id uuid)
RETURNS TABLE(user_id uuid, score int)
LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
  RETURN QUERY
  SELECT sp.user_id, COALESCE(SUM(ps.score_earned), 0)::int AS score
  FROM public.session_participants sp
  JOIN public.present_sessions ps ON ps.id = sp.session_id
  WHERE ps.family_group_id = p_family_group_id
    AND ps.status = 'completed'
    AND ps.started_at >= date_trunc('week', now())
  GROUP BY sp.user_id;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_weekly_score(uuid) TO authenticated;
GRANT EXECUTE ON FUNCTION public.get_member_scores_this_week(uuid) TO authenticated;
