import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/app_router.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/app_localizations.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  int _locationToIndex(String loc) {
    if (loc.startsWith(Routes.dashboard)) return 1;
    if (loc.startsWith(Routes.rituals)) return 2;
    if (loc.startsWith(Routes.family)) return 3;
    if (loc.startsWith(Routes.diary)) return 4;
    if (loc.startsWith(Routes.settings)) return 5;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0: context.go(Routes.home); break;
      case 1: context.go(Routes.dashboard); break;
      case 2: context.go(Routes.rituals); break;
      case 3: context.go(Routes.family); break;
      case 4: context.go(Routes.diary); break;
      case 5: context.go(Routes.settings); break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final loc = GoRouterState.of(context).matchedLocation;
    final current = _locationToIndex(loc);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: current,
        onDestinationSelected: (i) => _onTap(context, i),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded, color: AppColors.teal), label: 'Home'),
          NavigationDestination(icon: const Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart_rounded, color: AppColors.teal), label: l10n.dashboardTitle),
          NavigationDestination(icon: const Icon(Icons.spa_outlined), selectedIcon: Icon(Icons.spa_rounded, color: AppColors.teal), label: l10n.ritualsTitle),
          NavigationDestination(icon: const Icon(Icons.people_outline_rounded), selectedIcon: Icon(Icons.people_rounded, color: AppColors.teal), label: l10n.familyTitle),
          NavigationDestination(icon: const Icon(Icons.book_outlined), selectedIcon: Icon(Icons.book_rounded, color: AppColors.teal), label: l10n.diaryTitle),
          NavigationDestination(icon: const Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings_rounded, color: AppColors.teal), label: l10n.settingsTitle),
        ],
      ),
    );
  }
}
