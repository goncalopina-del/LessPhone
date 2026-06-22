import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

import '../../../core/auth/auth_provider.dart';
import '../../../core/router/app_router.dart';
import '../../../core/security/secure_storage.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/present_text_field.dart';

class AuthScreen extends ConsumerStatefulWidget {
  final String? magicLinkToken;
  const AuthScreen({super.key, this.magicLinkToken});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _magicLinkSent = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    if (widget.magicLinkToken != null) {
      _handleMagicLinkCallback(widget.magicLinkToken!);
    } else {
      _maybeAuthenticateWithBiometric();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _maybeAuthenticateWithBiometric() async {
    final enabled = await SecureStorage.getBiometricEnabled();
    if (!enabled || !mounted) return;

    final auth = LocalAuthentication();
    final canCheck = await auth.canCheckBiometrics;
    if (!canCheck || !mounted) return;

    final l10n = AppLocalizations.of(context);
    try {
      final ok = await auth.authenticate(
        localizedReason: l10n.authBiometricPrompt,
        options: const AuthenticationOptions(stickyAuth: true),
      );
      if (ok && mounted && ref.read(currentUserProvider) != null) {
        context.go(Routes.home);
      }
    } catch (_) {}
  }

  Future<void> _handleMagicLinkCallback(String token) async {
    setState(() => _isLoading = true);
    try {
      await ref.read(authRepositoryProvider).handleMagicLinkToken(token);
      if (mounted) context.go(Routes.home);
    } catch (_) {
      if (mounted) {
        setState(() {
          _error = AppLocalizations.of(context).errorAuthFailed;
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _signInWithApple() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      await ref.read(authRepositoryProvider).signInWithApple();
      if (mounted) context.go(Routes.home);
    } catch (_) {
      if (mounted) setState(() => _error = AppLocalizations.of(context).errorAuthFailed);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithGoogle() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      await ref.read(authRepositoryProvider).signInWithGoogle();
    } catch (_) {
      if (mounted) setState(() => _error = AppLocalizations.of(context).errorAuthFailed);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _sendMagicLink() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() { _isLoading = true; _error = null; });
    try {
      await ref.read(authRepositoryProvider).sendMagicLink(_emailController.text);
      if (mounted) setState(() => _magicLinkSent = true);
    } catch (_) {
      if (mounted) setState(() => _error = AppLocalizations.of(context).errorGeneric);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.ink,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Center(child: Text('PRESENT', style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.teal, letterSpacing: 0.3)))
                  .animate().fadeIn(duration: 400.ms),
              const SizedBox(height: 48),
              if (_magicLinkSent)
                _MagicLinkSentView(email: _emailController.text.trim(), l10n: l10n)
              else ...[
                _SocialButton(label: l10n.authSignInWithApple, icon: Icons.apple, backgroundColor: Colors.white, textColor: Colors.black, onTap: _isLoading ? null : _signInWithApple)
                    .animate().fadeIn(delay: 80.ms, duration: 350.ms),
                const SizedBox(height: 12),
                _SocialButton(label: l10n.authSignInWithGoogle, googleG: true, backgroundColor: const Color(0xFF4285F4), textColor: Colors.white, onTap: _isLoading ? null : _signInWithGoogle)
                    .animate().fadeIn(delay: 140.ms, duration: 350.ms),
                const SizedBox(height: 24),
                Row(children: [
                  Expanded(child: Divider(color: AppColors.paper.withOpacity(0.12))),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text(l10n.authOr, style: TextStyle(color: AppColors.paper.withOpacity(0.4), fontSize: 13))),
                  Expanded(child: Divider(color: AppColors.paper.withOpacity(0.12))),
                ]).animate().fadeIn(delay: 200.ms, duration: 350.ms),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    PresentTextField(
                      controller: _emailController,
                      hintText: l10n.authEmailPlaceholder,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _sendMagicLink(),
                      validator: (v) {
                        final value = v?.trim() ?? '';
                        final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value);
                        return ok ? null : l10n.errorInvalidEmail;
                      },
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: _isLoading ? null : _sendMagicLink,
                        child: _isLoading
                            ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.teal))
                            : Text(l10n.authSendMagicLink),
                      ),
                    ),
                  ]),
                ).animate().fadeIn(delay: 260.ms, duration: 350.ms),
                const SizedBox(height: 16),
                Center(child: Text(l10n.authNoPassword, style: TextStyle(color: AppColors.paper.withOpacity(0.35), fontSize: 12)))
                    .animate().fadeIn(delay: 320.ms, duration: 350.ms),
              ],
              if (_error != null) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: AppColors.rose.withOpacity(0.1), borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.rose.withOpacity(0.3))),
                  child: Text(_error!, style: const TextStyle(color: AppColors.rose, fontSize: 13), textAlign: TextAlign.center),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MagicLinkSentView extends StatelessWidget {
  final String email;
  final AppLocalizations l10n;
  const _MagicLinkSentView({required this.email, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('📬', style: TextStyle(fontSize: 56)),
      const SizedBox(height: 20),
      Text(l10n.authMagicLinkSent(email), style: const TextStyle(color: AppColors.paper, fontSize: 16), textAlign: TextAlign.center),
    ]).animate().fadeIn(duration: 400.ms).slideY(begin: 0.08);
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool googleG;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const _SocialButton({required this.label, this.icon, this.googleG = false, required this.backgroundColor, required this.textColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor, foregroundColor: textColor, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (googleG)
              Padding(padding: const EdgeInsets.only(right: 10), child: Text('G', style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'PlusJakartaSans')))
            else if (icon != null)
              Padding(padding: const EdgeInsets.only(right: 10), child: Icon(icon, color: textColor, size: 20)),
            Text(label, style: TextStyle(color: textColor, fontSize: 15, fontWeight: FontWeight.w600, fontFamily: 'PlusJakartaSans')),
          ],
        ),
      ),
    );
  }
}
