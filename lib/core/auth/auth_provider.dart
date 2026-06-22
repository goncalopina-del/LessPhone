import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../database/supabase_client.dart';
import '../security/secure_storage.dart';

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
    return supabase.auth.signInWithOAuth(
      OAuthProvider.apple,
      redirectTo: 'present://auth/confirm',
    );
  }

  Future<bool> signInWithGoogle() async {
    return supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'present://auth/confirm',
      authScreenLaunchMode: LaunchMode.inAppBrowserView,
    );
  }

  Future<void> sendMagicLink(String email) async {
    await supabase.auth.signInWithOtp(
      email: email.trim(),
      emailRedirectTo: 'present://auth/confirm',
      shouldCreateUser: true,
    );
  }

  Future<AuthResponse?> handleMagicLinkToken(String token) async {
    return supabase.auth.verifyOTP(
      token: token,
      type: OtpType.magiclink,
    );
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
