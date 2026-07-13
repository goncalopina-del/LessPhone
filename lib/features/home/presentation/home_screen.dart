import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/auth_provider.dart';
import '../../../core/database/supabase_client.dart';
import '../../../core/providers/family_provider.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class _ScoreData {
  final int score;
  final int delta;
  final int percentile;
  const _ScoreData({required this.score, required this.delta, required this.percentile});
}

final _weeklyScoreProvider = FutureProvider<_ScoreData>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return const _ScoreData(score: 0, delta: 0, percentile: 0);

  final result = await supabase.rpc('get_weekly_score', params: {'p_user_id': user.id});
  final map = result as Map<String, dynamic>? ?? {};
  return _ScoreData(
    score: (map['score'] as num?)?.toInt() ?? 0,
    delta: (map['delta'] as num?)?.toInt() ?? 0,
    percentile: (map['percentile'] as num?)?.toInt() ?? 0,
  );
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final user = ref.watch(currentUserProvider);
    final firstName = (user?.userMetadata?['full_name'] as String?)?.split(' ').first ?? (user?.email?.split('@').first ?? '');

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.teal,
          onRefresh: () async {
            ref.invalidate(_weeklyScoreProvider);
            ref.invalidate(familyPresenceProvider);
          },
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(child: Text(l10n.homeGreeting(firstName), style: Theme.of(context).textTheme.titleLarge).animate().fadeIn(duration: 400.ms)),
                      IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () => context.push(Routes.settings)),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _ScoreCard(l10n: l10n).animate().fadeIn(delay: 80.ms, duration: 400.ms).slideY(begin: 0.08),
                    const SizedBox(height: 16),
                    _FamilyCard(l10n: l10n).animate().fadeIn(delay: 140.ms, duration: 400.ms).slideY(begin: 0.08),
                    const SizedBox(height: 20),
                    _StartSessionButton(l10n: l10n).animate().fadeIn(delay: 200.ms, duration: 400.ms),
                    const SizedBox(height: 16),
                    _QuickLink(icon: Icons.spa_outlined, label: l10n.homeRitualSuggested, onTap: () => context.go(Routes.rituals)).animate().fadeIn(delay: 260.ms, duration: 400.ms),
                    const SizedBox(height: 8),
                    _QuickLink(icon: Icons.book_outlined, label: l10n.homeDiaryThisWeek, onTap: () => context.go(Routes.diary)).animate().fadeIn(delay: 300.ms, duration: 400.ms),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreCard extends ConsumerWidget {
  final AppLocalizations l10n;
  const _ScoreCard({required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(_weeklyScoreProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.teal.withOpacity(0.15), AppColors.teal.withOpacity(0.04)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.teal.withOpacity(0.3)),
      ),
      child: async.when(
        loading: () => const SizedBox(height: 80, child: Center(child: CircularProgressIndicator(color: AppColors.teal, strokeWidth: 2))),
        error: (_, __) => SizedBox(height: 80, child: Center(child: Text(l10n.errorGeneric, style: const TextStyle(color: AppColors.rose)))),
        data: (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.homeOfflineScoreLabel, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.teal)),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${data.score}', style: Theme.of(context).textTheme.displayMedium?.copyWith(color: AppColors.teal, fontWeight: FontWeight.w900)),
                const SizedBox(width: 4),
                Padding(padding: const EdgeInsets.only(bottom: 8), child: Text('pts', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.teal.withOpacity(0.7)))),
                const Spacer(),
                if (data.delta != 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: (data.delta > 0 ? AppColors.green : AppColors.rose).withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      data.delta > 0 ? l10n.homeScoreUp(data.delta) : l10n.homeScoreDown(data.delta.abs()),
                      style: TextStyle(color: data.delta > 0 ? AppColors.green : AppColors.rose, fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
              ],
            ),
            if (data.score > 0) ...[
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(value: (data.score / 1000).clamp(0.0, 1.0), backgroundColor: AppColors.teal.withOpacity(0.1), valueColor: const AlwaysStoppedAnimation(AppColors.teal), minHeight: 6),
              ),
              if (data.percentile > 0) ...[
                const SizedBox(height: 6),
                Text(l10n.dashboardPercentile(data.percentile), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.teal.withOpacity(0.7))),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

class _FamilyCard extends ConsumerWidget {
  final AppLocalizations l10n;
  const _FamilyCard({required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(familyPresenceProvider);

    return async.when(
      loading: () => const SizedBox(height: 64, child: Center(child: CircularProgressIndicator(color: AppColors.teal, strokeWidth: 2))),
      error: (_, __) => const SizedBox.shrink(),
      data: (family) {
        if (family == null) return const SizedBox.shrink();
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.07)),
          ),
          child: Row(
            children: [
              _AvatarStack(members: family.members),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(family.name, style: Theme.of(context).textTheme.titleSmall),
                    Text(l10n.homeMembersPresent(family.onlineCount), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.teal)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AvatarStack extends StatelessWidget {
  final List<MemberPresence> members;
  const _AvatarStack({required this.members});

  static const _colors = [AppColors.teal, AppColors.violet, AppColors.amber, AppColors.blue];

  @override
  Widget build(BuildContext context) {
    final visible = members.take(4).toList();
    final width = (visible.length * 24 + 12).toDouble();

    return SizedBox(
      width: width,
      height: 40,
      child: Stack(
        children: visible.asMap().entries.map((e) {
          final color = _colors[e.key % _colors.length];
          return Positioned(
            left: (e.key * 24).toDouble(),
            child: Container(
              width: 36, height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(e.value.isOnline ? 0.2 : 0.07),
                border: Border.all(color: e.value.isOnline ? color : color.withOpacity(0.3), width: 2),
              ),
              child: Center(child: Text(e.value.initial, style: TextStyle(color: e.value.isOnline ? color : color.withOpacity(0.4), fontSize: 13, fontWeight: FontWeight.w700))),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _StartSessionButton extends StatelessWidget {
  final AppLocalizations l10n;
  const _StartSessionButton({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, height: 56,
      child: ElevatedButton(
        onPressed: () => context.go(Routes.session),
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.teal, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        child: Text(l10n.homeStartSession, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
      ),
    );
  }
}

class _QuickLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _QuickLink({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.07))),
      tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      leading: Icon(icon, color: AppColors.teal),
      title: Text(label, style: Theme.of(context).textTheme.bodyMedium),
      trailing: const Icon(Icons.chevron_right_rounded, size: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
