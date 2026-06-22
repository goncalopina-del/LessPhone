import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/auth/auth_provider.dart';
import '../../../core/providers/locale_provider.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/app_localizations.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    if (mounted) setState(() => _version = '${info.version} (${info.buildNumber})');
  }

  Future<void> _signOut() async {
    final l10n = AppLocalizations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l10n.settingsSignOut),
        content: Text('${l10n.settingsSignOut}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.cancelButton)),
          ElevatedButton(onPressed: () => Navigator.pop(context, true), style: ElevatedButton.styleFrom(backgroundColor: AppColors.rose), child: Text(l10n.settingsSignOut)),
        ],
      ),
    );
    if (confirm == true && mounted) {
      await ref.read(authRepositoryProvider).signOut();
      if (mounted) context.go(Routes.language);
    }
  }

  String _localeName(Locale? locale) {
    if (locale == null) return 'Auto';
    final match = supportedLocalesWithNames.where((e) => e.locale.languageCode == locale.languageCode && (e.locale.countryCode == locale.countryCode || e.locale.countryCode == null));
    return match.isNotEmpty ? match.first.name : supportedLocalesWithNames.first.name;
  }

  void _showLanguagePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => _LanguagePicker(
        currentLocale: ref.read(localeProvider),
        onSelected: (locale) async {
          await ref.read(localeProvider.notifier).setLocale(locale);
          if (mounted) Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = ref.watch(localeProvider);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              sliver: SliverToBoxAdapter(child: Text(l10n.settingsTitle, style: Theme.of(context).textTheme.headlineMedium)),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _Section(title: l10n.settingsLanguage, children: [
                    _Tile(icon: Icons.language_rounded, title: l10n.settingsLanguage, subtitle: _localeName(locale), onTap: _showLanguagePicker),
                  ]).animate().fadeIn(delay: 60.ms),
                  _Section(title: l10n.settingsNotifications, children: [
                    _SwitchTile(icon: Icons.spa_outlined, title: l10n.settingsNotificationsRituals, value: true),
                    _SwitchTile(icon: Icons.local_fire_department_outlined, title: l10n.settingsNotificationsStreak, value: true),
                    _SwitchTile(icon: Icons.people_outline, title: l10n.settingsNotificationsFamily, value: true),
                  ]).animate().fadeIn(delay: 100.ms),
                  _Section(title: l10n.settingsPrivacy, children: [
                    _Tile(icon: Icons.face_rounded, title: l10n.settingsBiometric, onTap: () {}),
                    _Tile(icon: Icons.lock_outline_rounded, title: l10n.settingsMfa, onTap: () {}),
                    _Tile(icon: Icons.download_outlined, title: l10n.settingsExportData, onTap: () {}),
                  ]).animate().fadeIn(delay: 140.ms),
                  _Section(title: l10n.settingsSubscription, children: [
                    _Tile(icon: Icons.star_outline_rounded, title: l10n.settingsSubscription, onTap: () => context.push(Routes.paywall)),
                  ]).animate().fadeIn(delay: 180.ms),
                  const SizedBox(height: 8),
                  ListTile(
                    onTap: _signOut,
                    leading: const Icon(Icons.logout_rounded, color: AppColors.rose),
                    title: Text(l10n.settingsSignOut, style: const TextStyle(color: AppColors.rose)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    tileColor: AppColors.rose.withOpacity(0.05),
                  ).animate().fadeIn(delay: 220.ms),
                  const SizedBox(height: 8),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.delete_outline_rounded, color: AppColors.rose.withOpacity(0.5)),
                    title: Text(l10n.settingsDeleteAccount, style: TextStyle(color: AppColors.rose.withOpacity(0.6), fontSize: 13)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ).animate().fadeIn(delay: 240.ms),
                  const SizedBox(height: 24),
                  if (_version.isNotEmpty)
                    Center(child: Text(l10n.settingsVersion(_version), style: TextStyle(color: context.pc.dim, fontSize: 11, fontFamily: 'PlusJakartaSans'))),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguagePicker extends StatelessWidget {
  final Locale? currentLocale;
  final ValueChanged<Locale> onSelected;
  const _LanguagePicker({required this.currentLocale, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context).settingsLanguage, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          ...supportedLocalesWithNames.map((e) {
            final isSelected = currentLocale?.languageCode == e.locale.languageCode && currentLocale?.countryCode == e.locale.countryCode;
            return ListTile(
              onTap: () => onSelected(e.locale),
              leading: Text(e.flag, style: const TextStyle(fontSize: 24)),
              title: Text(e.name),
              trailing: isSelected ? const Icon(Icons.check_rounded, color: AppColors.teal) : null,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              tileColor: isSelected ? AppColors.teal.withOpacity(0.08) : null,
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _Section({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.labelSmall?.copyWith(letterSpacing: 0.8, color: context.pc.dim)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(14), border: Border.all(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.07))),
          child: Column(children: children),
        ),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  const _Tile({required this.icon, required this.title, this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppColors.teal, size: 22),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      subtitle: subtitle != null ? Text(subtitle!, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: context.pc.muted)) : null,
      trailing: const Icon(Icons.chevron_right_rounded, size: 18),
    );
  }
}

class _SwitchTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool value;
  const _SwitchTile({required this.icon, required this.title, required this.value});

  @override
  State<_SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<_SwitchTile> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _value,
      onChanged: (v) => setState(() => _value = v),
      secondary: Icon(widget.icon, color: AppColors.teal, size: 22),
      title: Text(widget.title, style: Theme.of(context).textTheme.bodyMedium),
      activeColor: AppColors.teal,
    );
  }
}
