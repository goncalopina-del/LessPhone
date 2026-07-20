// supabase/functions/create-family-invite/index.ts
// action='invite' -> send email invites. action='join' -> accept via code.

import { serve } from "https://deno.land/std@0.177.0/http/server.ts";
import { createClient, type User } from "https://esm.sh/@supabase/supabase-js@2";

const supabase = createClient(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
);

serve(async (req: Request) => {
  if (req.method !== "POST") {
    return new Response("Method not allowed", { status: 405 });
  }

  const authHeader = req.headers.get("Authorization");
  if (!authHeader) return new Response("Unauthorized", { status: 401 });

  const { data: userData, error: authError } = await supabase.auth.getUser(
    authHeader.replace("Bearer ", ""),
  );
  if (authError || !userData?.user) return new Response("Unauthorized", { status: 401 });

  const body = await req.json();
  const action = body.action as string | undefined;

  if (action === "invite") {
    return await handleInvite(body, userData.user, req);
  } else if (action === "join") {
    return await handleJoin(body, userData.user);
  }

  return new Response("Unknown action", { status: 400 });
});

// Builds the post-invite redirect URL, choosing the web app URL when the
// request originates from the web build and the deep link otherwise.
// Uses the family invite_code (not the group id) so the /invite/:code route
// can resolve the family via handleJoin.
function buildInviteRedirect(body: Record<string, unknown>, req: Request, inviteCode: string): string {
  const explicit = body.redirect_url as string | undefined;
  if (explicit && /^https?:\/\//.test(explicit)) return explicit;

  const platform = body.platform as string | undefined;
  if (platform === "web") return `https://goncalopina-del.github.io/LessPhone/invite/${inviteCode}`;

  const origin = req.headers.get("origin") ?? req.headers.get("referer") ?? "";
  if (origin.includes("goncalopina-del.github.io") || origin.includes("github.io")) {
    return `https://goncalopina-del.github.io/LessPhone/invite/${inviteCode}`;
  }

  return `present://invite/${inviteCode}`;
}

async function handleInvite(body: Record<string, unknown>, inviter: User, req: Request): Promise<Response> {
  const familyGroupId = body.family_group_id as string | undefined;
  const emails = body.emails as string[] | undefined;

  if (!familyGroupId || !emails) {
    return new Response("Missing family_group_id or emails", { status: 400 });
  }

  const { data: member } = await supabase
    .from("family_members")
    .select("role")
    .eq("family_group_id", familyGroupId)
    .eq("user_id", inviter.id)
    .eq("status", "active")
    .single();

  if (!member || member.role !== "admin") {
    return new Response("Forbidden — only admins can invite", { status: 403 });
  }

  const { data: family } = await supabase
    .from("family_groups")
    .select("invite_code")
    .eq("id", familyGroupId)
    .single();

  if (!family?.invite_code) {
    return new Response("Family invite code not found", { status: 404 });
  }

  const validEmails = emails
    .slice(0, 7)
    .filter((e) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(e));

  const results: Record<string, string> = {};

  for (const email of validEmails) {
    try {
      const { error } = await supabase.auth.admin.inviteUserByEmail(email, {
        data: { family_group_id: familyGroupId, invite_code: family.invite_code, invited_by: inviter.id, action: "family_invite" },
        redirectTo: buildInviteRedirect(body, req, family.invite_code),
      });

      if (error) {
        results[email] = `error: ${error.message}`;
        continue;
      }

      await supabase.from("audit_log").insert({
        user_id: inviter.id,
        action: "family_invite_sent",
        metadata: { email, family_group_id: familyGroupId },
      });

      results[email] = "sent";
    } catch (err) {
      const message = err instanceof Error ? err.message : "unknown";
      results[email] = `error: ${message}`;
    }
  }

  return new Response(JSON.stringify({ results }), {
    headers: { "Content-Type": "application/json" },
  });
}

async function handleJoin(body: Record<string, unknown>, joiner: User): Promise<Response> {
  const inviteCode = body.invite_code as string | undefined;
  if (!inviteCode) return new Response("Missing invite_code", { status: 400 });

  const { data: family, error } = await supabase
    .from("family_groups")
    .select("id, name")
    .eq("invite_code", inviteCode)
    .single();

  if (error || !family) {
    return new Response("Invalid invite code", { status: 404 });
  }

  const { data: existing } = await supabase
    .from("family_members")
    .select("id, status")
    .eq("family_group_id", family.id)
    .eq("user_id", joiner.id)
    .single();

  if (existing?.status === "active") {
    return new Response(JSON.stringify({ family, already_member: true }), {
      headers: { "Content-Type": "application/json" },
    });
  }

  const { count } = await supabase
    .from("family_members")
    .select("id", { count: "exact", head: true })
    .eq("family_group_id", family.id)
    .eq("status", "active");

  if ((count ?? 0) >= 8) {
    return new Response("Family is full (max 8 members)", { status: 400 });
  }

  await supabase.from("family_members").upsert({
    user_id: joiner.id,
    family_group_id: family.id,
    status: "active",
    role: "adult",
    joined_at: new Date().toISOString(),
  });

  const { data: adminMember } = await supabase
    .from("family_members")
    .select("user_id")
    .eq("family_group_id", family.id)
    .eq("role", "admin")
    .single();

  if (adminMember) {
    try {
      await supabase.functions.invoke("send-nudge-notification", {
        body: {
          type: "invite_accepted",
          user_ids: [adminMember.user_id],
          data: { name: joiner.user_metadata?.full_name ?? joiner.email ?? "", family: family.name },
        },
        headers: { "X-Service-Key": Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")! },
      });
    } catch {
      // Non-blocking — notification failure shouldn't fail the join
    }
  }

  await supabase.from("audit_log").insert({
    user_id: joiner.id,
    action: "family_joined",
    metadata: { family_group_id: family.id, via: "invite_code" },
  });

  return new Response(JSON.stringify({ family, joined: true }), {
    headers: { "Content-Type": "application/json" },
  });
}
