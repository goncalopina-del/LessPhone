// supabase/functions/process-session-end/index.ts
// Calculates Offline Score after a session ends.

import { serve } from "https://deno.land/std@0.177.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const supabase = createClient(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
);

interface SessionRow {
  id: string;
  family_group_id: string;
  duration_minutes: number | null;
  session_participants: { user_id: string }[];
}

serve(async (req: Request) => {
  if (req.method !== "POST") {
    return new Response("Method not allowed", { status: 405 });
  }

  const authHeader = req.headers.get("Authorization");
  if (!authHeader) {
    return new Response("Unauthorized", { status: 401 });
  }

  const { data: userData, error: authError } = await supabase.auth.getUser(
    authHeader.replace("Bearer ", ""),
  );
  if (authError || !userData?.user) {
    return new Response("Unauthorized", { status: 401 });
  }

  const body = await req.json();
  const sessionId = body.session_id as string | undefined;
  const durationMinutes = body.duration_minutes as number | undefined;

  if (!sessionId && durationMinutes === undefined) {
    return new Response("Missing session_id or duration_minutes", { status: 400 });
  }

  try {
    let score: number;

    if (sessionId) {
      const { data: session, error: sessionError } = await supabase
        .from("present_sessions")
        .select("*, session_participants(user_id)")
        .eq("id", sessionId)
        .single<SessionRow>();

      if (sessionError || !session) {
        throw new Error("Session not found");
      }

      const wasParticipant = session.session_participants.some(
        (p: { user_id: string }) => p.user_id === userData.user.id,
      );
      if (!wasParticipant) {
        return new Response("Forbidden", { status: 403 });
      }

      score = calculateScore(session.duration_minutes ?? 0, session.session_participants.length);

      await supabase.from("present_sessions").update({ score_earned: score }).eq("id", sessionId);
    } else {
      score = calculateScore(durationMinutes!, 1);
    }

    await supabase.from("audit_log").insert({
      user_id: userData.user.id,
      action: "session_score_calculated",
      metadata: { session_id: sessionId ?? null, score },
    });

    return new Response(JSON.stringify({ score }), {
      headers: { "Content-Type": "application/json" },
    });
  } catch (err) {
    const message = err instanceof Error ? err.message : "Unknown error";
    return new Response(JSON.stringify({ error: message }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
});

function calculateScore(durationMinutes: number, participantCount: number): number {
  if (durationMinutes < 5) return 0;

  let score = durationMinutes;
  if (participantCount > 1) {
    score = score * (1 + (participantCount - 1) * 0.3);
  }
  if (durationMinutes >= 60) {
    score += 50;
  } else if (durationMinutes >= 30) {
    score += 20;
  }
  return Math.min(Math.round(score), 300);
}
