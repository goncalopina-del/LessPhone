import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/auth/auth_provider.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);
    _ctrl.forward();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(milliseconds: 1800));
    if (!mounted) return;

    final session = ref.read(authStateProvider).value?.session;
    final localeSet = (Hive.box<String>('prefs').get('locale_lang') ?? '').isNotEmpty;

    if (session != null) {
      context.go(Routes.home);
    } else if (localeSet) {
      context.go(Routes.auth);
    } else {
      context.go(Routes.language);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ink,
      body: FadeTransition(
        opacity: _fade,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80, height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.teal.withOpacity(0.15),
                  border: Border.all(color: AppColors.teal.withOpacity(0.4), width: 1.5),
                ),
                child: const Center(child: Text('🌿', style: TextStyle(fontSize: 36))),
              ),
              const SizedBox(height: 20),
              const Text('PRESENT', style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.teal, letterSpacing: 0.35)),
              const SizedBox(height: 8),
              Text('presente · presença', style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 11, color: AppColors.paper.withOpacity(0.3), letterSpacing: 0.15)),
            ],
          ),
        ),
      ),
    );
  }
}
