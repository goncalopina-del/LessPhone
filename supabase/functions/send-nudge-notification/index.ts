// supabase/functions/send-nudge-notification/index.ts
// Sends FCM push notifications in the recipient's language.

import { serve } from "https://deno.land/std@0.177.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const supabase = createClient(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
);

const FCM_SERVER_KEY = Deno.env.get("FCM_SERVER_KEY")!;

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type, x-service-key",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

const jsonHeaders = { ...corsHeaders, "Content-Type": "application/json" };

type NotificationType = "ritual" | "streak" | "trial_ending" | "invite_accepted";

interface NotificationPayload {
  type: NotificationType;
  user_ids: string[];
  data?: Record<string, string>;
}

interface Template {
  title: string;
  body: string;
}

const templates: Record<NotificationType, Record<string, Template>> = {
  ritual: {
    en: { title: "Good evening, {family} 🌿", body: "A great time for 30 minutes together." },
    "pt-PT": { title: "Boa noite, {family} 🌿", body: "Uma boa altura para 30 minutos juntos." },
    "pt-BR": { title: "Boa noite, {family} 🌿", body: "Uma ótima hora para 30 minutos juntos." },
    es: { title: "Buenas noches, {family} 🌿", body: "Un buen momento para 30 minutos juntos." },
  },
  streak: {
    en: { title: "Your streak is at risk 🔥", body: "You have {days} days in a row. Don't break it now!" },
    "pt-PT": { title: "A vossa sequência está em risco 🔥", body: "Têm {days} dias seguidos. Não deixem quebrar agora!" },
    "pt-BR": { title: "A sequência de vocês está em risco 🔥", body: "Vocês têm {days} dias seguidos. Não deixem quebrar agora!" },
    es: { title: "Vuestra racha está en riesgo 🔥", body: "Lleváis {days} días seguidos. ¡No lo dejéis romper ahora!" },
  },
  trial_ending: {
    en: { title: "Your free trial ends soon ⏳", body: "{days} days left. Continue for less than a coffee a month." },
    "pt-PT": { title: "O período gratuito termina em breve ⏳", body: "Faltam {days} dias. Continuem por menos do que um café por mês." },
    "pt-BR": { title: "O período gratuito termina em breve ⏳", body: "Faltam {days} dias. Continuem por menos do que um café por mês." },
    es: { title: "El período gratuito termina pronto ⏳", body: "Quedan {days} días. Seguid por menos de un café al mes." },
  },
  invite_accepted: {
    en: { title: "{name} joined {family}!", body: "You can now start Present Sessions together." },
    "pt-PT": { title: "{name} juntou-se a {family}!", body: "Já podem iniciar sessões presentes juntos." },
    "pt-BR": { title: "{name} entrou em {family}!", body: "Agora vocês podem iniciar sessões juntos." },
    es: { title: "¡{name} se unió a {family}!", body: "Ya podéis iniciar sesiones juntos." },
  },
};

function interpolate(template: string, vars: Record<string, string>): string {
  return Object.entries(vars).reduce((str, [key, val]) => str.replaceAll(`{${key}}`, val), template);
}

function getTemplate(type: NotificationType, locale: string): Template {
  const localeTemplates = templates[type];
  return localeTemplates[locale] ?? localeTemplates[locale.split("-")[0]] ?? localeTemplates["en"];
}

serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  if (req.method !== "POST") {
    return new Response("Method not allowed", { status: 405, headers: corsHeaders });
  }

  const serviceKey = req.headers.get("X-Service-Key");
  if (serviceKey !== Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")) {
    return new Response("Unauthorized", { status: 401, headers: corsHeaders });
  }

  const payload = await req.json() as NotificationPayload;
  const results: Record<string, string> = {};

  for (const userId of payload.user_ids) {
    try {
      const { data: user } = await supabase.from("users").select("locale").eq("id", userId).single();

      const { data: tokenRow } = await supabase
        .from("fcm_tokens")
        .select("token")
        .eq("user_id", userId)
        .order("created_at", { ascending: false })
        .limit(1)
        .single();

      if (!tokenRow?.token) {
        results[userId] = "no_token";
        continue;
      }

      const locale = user?.locale ?? "en";
      const template = getTemplate(payload.type, locale);

      const title = interpolate(template.title, payload.data ?? {});
      const body = interpolate(template.body, payload.data ?? {});

      const fcmResponse = await fetch("https://fcm.googleapis.com/fcm/send", {
        method: "POST",
        headers: {
          "Authorization": `key=${FCM_SERVER_KEY}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          to: tokenRow.token,
          notification: { title, body },
          data: { type: payload.type, ...payload.data },
        }),
      });

      results[userId] = fcmResponse.ok ? "sent" : "failed";
    } catch (err) {
      const message = err instanceof Error ? err.message : "unknown";
      results[userId] = `error: ${message}`;
    }
  }

  return new Response(JSON.stringify({ results }), { headers: jsonHeaders });
});
