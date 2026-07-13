import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/locale_provider.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends ConsumerStatefulWidget {
  const LanguageScreen({super.key});

  @override
  ConsumerState<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends ConsumerState<LanguageScreen> {
  late Locale _selected;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _selected = ref.read(localeProvider) ?? _detectDeviceLocale();
  }

  Locale _detectDeviceLocale() {
    final device = WidgetsBinding.instance.platformDispatcher.locale;
    for (final e in supportedLocalesWithNames) {
      if (e.locale.languageCode == device.languageCode && e.locale.countryCode == device.countryCode) {
        return e.locale;
      }
    }
    for (final e in supportedLocalesWithNames) {
      if (e.locale.languageCode == device.languageCode) return e.locale;
    }
    return const Locale('en');
  }

  Future<void> _confirm() async {
    if (_saving) return;
    setState(() => _saving = true);
    await ref.read(localeProvider.notifier).setLocale(_selected);
    if (mounted) context.go(Routes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.ink,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text('🌍', style: TextStyle(fontSize: 48)).animate().fadeIn(duration: 400.ms).slideY(begin: -0.15),
              const SizedBox(height: 24),
              Text(l10n.languageScreenTitle, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.paper, fontWeight: FontWeight.w700))
                  .animate().fadeIn(delay: 80.ms, duration: 400.ms),
              const SizedBox(height: 8),
              Text(l10n.languageScreenSubtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.paper.withOpacity(0.45)))
                  .animate().fadeIn(delay: 130.ms, duration: 400.ms),
              const SizedBox(height: 36),
              Expanded(
                child: ListView.separated(
                  itemCount: supportedLocalesWithNames.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final e = supportedLocalesWithNames[i];
                    final isSelected = _selected.languageCode == e.locale.languageCode && _selected.countryCode == e.locale.countryCode;
                    return _LocaleTile(
                      flag: e.flag, name: e.name, isSelected: isSelected,
                      onTap: () => setState(() => _selected = e.locale),
                    ).animate().fadeIn(delay: (180 + i * 50).ms, duration: 300.ms).slideX(begin: 0.08);
                  },
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saving ? null : _confirm,
                  child: _saving
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : Text(l10n.continueButton),
                ),
              ).animate().fadeIn(delay: 480.ms, duration: 400.ms),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocaleTile extends StatelessWidget {
  final String flag;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const _LocaleTile({required this.flag, required this.name, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.teal.withOpacity(0.12) : AppColors.inkSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: isSelected ? AppColors.teal : AppColors.paper.withOpacity(0.08), width: isSelected ? 1.5 : 1),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        leading: Text(flag, style: const TextStyle(fontSize: 24)),
        title: Text(name, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 15, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400, color: isSelected ? AppColors.teal : AppColors.paper)),
        trailing: isSelected
            ? const Icon(Icons.check_circle_rounded, color: AppColors.teal, size: 22)
            : Icon(Icons.circle_outlined, color: AppColors.paper.withOpacity(0.2), size: 22),
      ),
    );
  }
}
