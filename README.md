# Present App

**Reconnect with the people that matter most.**

> "We don't block. We replace. Instead of scrolling, do something that actually matters."

## Tech Stack

| Layer | Technology |
|---|---|
| Mobile | Flutter 3.22 + Dart 3 |
| State | Riverpod 2 |
| Navigation | GoRouter |
| Backend | Supabase (PostgreSQL + RLS + Edge Functions) |
| Auth | Apple Sign-In · Google Sign-In · Magic Link · Biometrics · MFA/TOTP |
| Push | Firebase Cloud Messaging |
| Billing | RevenueCat |
| i18n | flutter_localizations + intl (ARB) — 10 languages |

**Languages:** PT-PT · PT-BR · EN · ZH · HI · ES · AR (RTL) · FR · BN · RU · ID

## Prerequisites

- Flutter ≥ 3.22.0 ([flutter.dev](https://flutter.dev/docs/get-started/install))
- Supabase CLI (`npm i -g supabase`)
- Node.js ≥ 18
- Xcode ≥ 15 (iOS builds only, requires a Mac)
- Android Studio (Android builds)

## Setup

### 1. Clone and create Supabase project

```bash
git clone https://github.com/YOUR_ORG/present_app.git
cd present_app
```

Create a project at [supabase.com](https://supabase.com) in **EU West (Frankfurt)** for GDPR compliance. Note your Project URL and anon key.

### 2. Apply database schema + seed

```bash
npm install -g supabase
supabase link --project-ref YOUR_PROJECT_REF
supabase db push
supabase db execute --file supabase/seed/seed.sql
```

### 3. Configure Supabase Auth

In the Supabase dashboard → Authentication → Providers:
- **Apple**: enable, set Bundle ID `app.present.ios`, redirect `present://auth/confirm`
- **Google**: enable, create OAuth credentials in Google Cloud Console, same redirect
- **Email**: already enabled (magic link), same redirect

### 4. Firebase (push notifications only)

1. Create a project at [Firebase Console](https://console.firebase.google.com)
2. Add iOS app `app.present.ios` → download `GoogleService-Info.plist` → place in `ios/Runner/`
3. Add Android app `app.present.android` → download `google-services.json` → place in `android/app/`
4. Run `flutterfire configure` to regenerate `lib/firebase_options.dart` with real values
5. Copy the Cloud Messaging Server Key (legacy) for the Edge Function secret below

### 5. RevenueCat

Create a project at [revenuecat.com](https://www.revenuecat.com), add iOS and Android apps, note the API keys.

### 6. Deploy Edge Functions

```bash
supabase functions deploy create-family-invite
supabase functions deploy process-session-end
supabase functions deploy send-nudge-notification
supabase secrets set FCM_SERVER_KEY=your_fcm_server_key
```

### 7. Install dependencies and generate code

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

### 8. Run

```bash
flutter run \
  --dart-define=SUPABASE_URL=https://YOUR_REF.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=eyJ... \
  --dart-define=REVENUECAT_APPLE_KEY=appl_... \
  --dart-define=REVENUECAT_GOOGLE_KEY=goog_...
```

## Architecture

```
lib/
├── core/
│   ├── auth/            # AuthRepository, auth state providers
│   ├── database/        # Supabase client singleton
│   ├── providers/       # locale_provider, family_provider (shared)
│   ├── router/          # GoRouter, Routes constants, auth guards
│   ├── security/        # Secure storage (Keychain/Keystore)
│   ├── theme/           # AppColors, AppTheme, PresentColors extension
│   └── utils/           # Env (dart-define config)
├── features/
│   ├── onboarding/      # splash, language, onboarding slides, auth, family setup
│   ├── home/             # home screen (score + family presence)
│   ├── session/          # active session timer, completion screen
│   ├── dashboard/        # stats, weekly chart, percentile
│   ├── rituals/           # ritual suggestions (i18n from DB)
│   ├── family/             # member list, invites
│   ├── diary/               # session diary entries
│   ├── subscription/         # RevenueCat paywall
│   └── settings/               # language picker, notifications, sign out
├── shared/widgets/      # MainShell (bottom nav), ErrorScreen, PresentTextField
├── l10n/                # 11 ARB files (10 languages + template)
└── main.dart
```

## Known gaps to fill before App Store / Play Store submission

- **App icons**: `assets/images/` and Android `mipmap-*` / iOS `AppIcon.appiconset` are placeholders — add real icon assets.
- **Custom fonts**: pubspec currently uses system fonts only (no `fonts:` section). If you want PlusJakartaSans/PlayfairDisplay as referenced in the design system, download the `.ttf` files into `assets/fonts/` and add a `fonts:` block to `pubspec.yaml`.
- **`lib/firebase_options.dart`**: contains placeholder values. Run `flutterfire configure` to replace with real Firebase project values.
- **iOS signing**: requires an Apple Developer account, Bundle ID registration, and Sign In with Apple capability enabled in Xcode.
- **Android signing**: requires a release keystore; set `KEYSTORE_PATH`, `KEY_ALIAS`, `KEY_PASSWORD`, `STORE_PASSWORD` env vars for CI.

## GitHub Secrets required (CI/CD)

| Secret | Description |
|---|---|
| `SUPABASE_URL` | Supabase project URL |
| `SUPABASE_ANON_KEY` | Supabase anon key |
| `REVENUECAT_APPLE_KEY` | RevenueCat Apple API key |
| `REVENUECAT_GOOGLE_KEY` | RevenueCat Google API key |

## License

Private — © Present App. All rights reserved.
