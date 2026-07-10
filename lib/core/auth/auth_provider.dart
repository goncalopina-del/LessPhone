import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../database/supabase_client.dart';
import '../security/secure_storage.dart';

String get _webAuthCallbackUrl {
  final base = Uri.base;
  return '${base.origin}${base.path}auth/confirm';
}

final authStateProvider = StreamProvider<AuthState>((ref) {
  return supabase.auth.onAuthStateChange;
});

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authStateProvider).value?.session?.user;
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(currentUserProvider) != null;
});

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(),
);

class AuthRepository {
  Future<bool> signInWithApple() async {
    final redirectTo = kIsWeb ? _webAuthCallbackUrl : 'present://auth/confirm';
    return supabase.auth.signInWithOAuth(
      OAuthProvider.apple,
      redirectTo: redirectTo,
    );
  }

  Future<bool> signInWithGoogle() async {
    final redirectTo = kIsWeb ? _webAuthCallbackUrl : 'present://auth/confirm';
    return supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: redirectTo,
      authScreenLaunchMode: LaunchMode.inAppBrowserView,
    );
  }

  Future<void> sendMagicLink(String email) async {
    final redirectTo = kIsWeb ? _webAuthCallbackUrl : 'present://auth/confirm';
    await supabase.auth.signInWithOtp(
      email: email.trim(),
      emailRedirectTo: redirectTo,
      shouldCreateUser: true,
    );
  }

  Future<Session?> signUpWithEmail(String email, String password) async {
    final res = await supabase.auth.signUp(
      email: email.trim(),
      password: password,
      emailRedirectTo: kIsWeb ? _webAuthCallbackUrl : 'present://auth/confirm',
    );
    return res.session;
  }

  Future<Session?> signInWithEmail(String email, String password) async {
    final res = await supabase.auth.signInWithPassword(
      email: email.trim(),
      password: password,
    );
    return res.session;
  }

  Future<Session?> handleMagicLinkCallback({
    String? code,
    String? token,
    String? tokenHash,
  }) async {
    final uri = Uri.base;
    final hasParam = (code?.isNotEmpty ?? false) ||
        (token?.isNotEmpty ?? false) ||
        (tokenHash?.isNotEmpty ?? false) ||
        uri.queryParameters.containsKey('code') ||
        uri.queryParameters.containsKey('token_hash') ||
        uri.queryParameters.containsKey('token');
    if (!hasParam) return null;
    try {
      final res = await supabase.auth.getSessionFromUrl(uri);
      return res.session;
    } catch (_) {
      if (code != null && code.isNotEmpty) {
        final res = await supabase.auth.exchangeCodeForSession(code);
        return res.session;
      }
      if (token != null && token.isNotEmpty) {
        final res = await supabase.auth.verifyOTP(
          token: token,
          type: OtpType.magiclink,
        );
        return res.session;
      }
    }
    return null;
  }

  Future<AuthMFAEnrollResponse> enrollMfa() {
    return supabase.auth.mfa.enroll(
      factorType: FactorType.totp,
      issuer: 'Present',
    );
  }

  Future<AuthMFAVerifyResponse> verifyMfa({
    required String factorId,
    required String code,
  }) async {
    final challenge = await supabase.auth.mfa.challenge(factorId: factorId);
    return supabase.auth.mfa.verify(
      factorId: factorId,
      challengeId: challenge.id,
      code: code,
    );
  }

  Future<void> unenrollMfa(String factorId) {
    return supabase.auth.mfa.unenroll(factorId);
  }

  Future<void> signOut() async {
    await SecureStorage.clear();
    final box = Hive.box<String>('prefs');
    await box.delete('locale_lang');
    await box.delete('locale_country');
    await Hive.box<dynamic>('session_cache').clear();
    await supabase.auth.signOut();
  }

  Session? get currentSession => supabase.auth.currentSession;
}
