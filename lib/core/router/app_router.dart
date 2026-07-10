import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_provider.dart';
import '../../features/onboarding/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/language_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/onboarding/presentation/auth_screen.dart';
import '../../features/onboarding/presentation/family_setup_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/session/presentation/session_screen.dart';
import '../../features/session/presentation/session_complete_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/rituals/presentation/rituals_screen.dart';
import '../../features/family/presentation/family_screen.dart';
import '../../features/diary/presentation/diary_screen.dart';
import '../../features/subscription/presentation/paywall_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../shared/widgets/main_shell.dart';
import '../../shared/widgets/error_screen.dart';

export '../../features/session/presentation/session_complete_screen.dart'
    show SessionCompleteExtra;

abstract final class Routes {
  static const splash = '/';
  static const language = '/language';
  static const onboarding = '/onboarding';
  static const auth = '/auth';
  static const authConfirm = '/auth/confirm';
  static const familySetup = '/setup/family';
  static const home = '/home';
  static const session = '/session';
  static const sessionComplete = '/session/complete';
  static const dashboard = '/dashboard';
  static const rituals = '/rituals';
  static const family = '/family';
  static const diary = '/diary';
  static const settings = '/settings';
  static const paywall = '/paywall';
  static const invite = '/invite/:code';
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final authAsync = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: false,
    redirect: (context, state) {
      if (state.matchedLocation == Routes.splash) return null;

      final isLoggedIn = authAsync.value?.session != null;
      final loc = state.matchedLocation;

      final isPublic = loc == Routes.language ||
          loc == Routes.onboarding ||
          loc.startsWith('/auth') ||
          loc.startsWith('/invite');

      if (!isLoggedIn && !isPublic) return Routes.language;
      if (isLoggedIn && isPublic && loc != Routes.authConfirm) {
        return Routes.home;
      }
      return null;
    },
    routes: [
      GoRoute(path: Routes.splash, builder: (_, __) => const SplashScreen()),
      GoRoute(path: Routes.language, builder: (_, __) => const LanguageScreen()),
      GoRoute(path: Routes.onboarding, builder: (_, __) => const OnboardingScreen()),
      GoRoute(path: Routes.auth, builder: (_, __) => const AuthScreen()),
      GoRoute(
        path: Routes.authConfirm,
        builder: (_, state) => AuthScreen(
          magicLinkToken: state.uri.queryParameters['token'],
          magicLinkCode: state.uri.queryParameters['code'],
          magicLinkTokenHash: state.uri.queryParameters['token_hash'],
        ),
      ),
      GoRoute(path: Routes.familySetup, builder: (_, __) => const FamilySetupScreen()),
      GoRoute(
        path: Routes.invite,
        builder: (_, state) => FamilySetupScreen(inviteCode: state.pathParameters['code']),
      ),
      GoRoute(path: Routes.session, builder: (_, __) => const SessionScreen()),
      GoRoute(
        path: Routes.sessionComplete,
        builder: (_, state) => SessionCompleteScreen(extra: state.extra as SessionCompleteExtra?),
      ),
      GoRoute(path: Routes.paywall, builder: (_, __) => const PaywallScreen()),
      ShellRoute(
        builder: (_, __, child) => MainShell(child: child),
        routes: [
          GoRoute(path: Routes.home, builder: (_, __) => const HomeScreen()),
          GoRoute(path: Routes.dashboard, builder: (_, __) => const DashboardScreen()),
          GoRoute(path: Routes.rituals, builder: (_, __) => const RitualsScreen()),
          GoRoute(path: Routes.family, builder: (_, __) => const FamilyScreen()),
          GoRoute(path: Routes.diary, builder: (_, __) => const DiaryScreen()),
          GoRoute(path: Routes.settings, builder: (_, __) => const SettingsScreen()),
        ],
      ),
    ],
    errorBuilder: (_, state) => ErrorScreen(error: state.error),
  );
});
