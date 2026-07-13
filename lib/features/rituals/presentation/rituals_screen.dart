import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/auth_provider.dart';
import '../../../core/database/supabase_client.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../data/ritual_model.dart';

final _ritualsProvider = FutureProvider.family<List<RitualItem>, String>((ref, locale) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];

  final memberRow = await supabase
      .from('family_members')
      .select('family_group_id')
      .eq('user_id', user.id)
      .eq('status', 'active')
      .maybeSingle();

  final familyGroupId = memberRow?['family_group_id'] as String?;

  List<dynamic> rows;
  if (familyGroupId != null) {
    rows = await supabase
        .from('rituals')
        .select('id, title_i18n, duration_min, category')
        .eq('is_active', true)
        .or('is_system.eq.true,family_group_id.eq.$familyGroupId')
        .order('is_system', ascending: false)
        .order('created_at');
  } else {
    rows = await supabase.from('rituals').select('id, title_i18n, duration_min, category').eq('is_active', true).eq('is_system', true).order('created_at');
  }

  return rows.map((r) => RitualItem.fromJson(r as Map<String, dynamic>, locale)).where((r) => r.title.isNotEmpty).toList();
});

RitualItem? _suggested(List<RitualItem> items) {
  if (items.isEmpty) return null;
  final hour = DateTime.now().hour;
  final preferred = items.where((r) {
    if (hour < 12) return r.category == 'meal';
    if (hour >= 18) return r.category == 'meal' || r.category == 'indoor';
    return r.category == 'outdoor' || r.category == 'creative';
  }).firstOrNull;
  return preferred ?? items.first;
}

class RitualsScreen extends ConsumerWidget {
  const RitualsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final async = ref.watch(_ritualsProvider(locale));

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              sliver: SliverToBoxAdapter(child: Text(l10n.ritualsTitle, style: Theme.of(context).textTheme.headlineMedium)),
            ),
            async.when(
              loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator(color: AppColors.teal, strokeWidth: 2))),
              error: (_, __) => SliverFillRemaining(child: Center(child: Text(l10n.errorGeneric))),
              data: (items) {
                final suggest = _suggested(items);
                final others = suggest != null ? items.where((r) => r.id != suggest.id).toList() : items;

                return SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      if (suggest != null) ...[
                        Text(l10n.ritualsSuggestedNow, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.teal, letterSpacing: 0.5)),
                        const SizedBox(height: 12),
                        _FeaturedCard(ritual: suggest, l10n: l10n).animate().fadeIn(delay: 80.ms, duration: 400.ms),
                        const SizedBox(height: 24),
                      ],
                      if (others.isNotEmpty) ...[
                        Text(l10n.ritualsOther, style: Theme.of(context).textTheme.labelMedium?.copyWith(letterSpacing: 0.5)),
                        const SizedBox(height: 12),
                        ...others.asMap().entries.map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _RitualTile(ritual: e.value, l10n: l10n),
                        ).animate().fadeIn(delay: (140 + e.key * 50).ms, duration: 350.ms)),
                      ],
                    ]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final RitualItem ritual;
  final AppLocalizations l10n;
  const _FeaturedCard({required this.ritual, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.teal.withOpacity(0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.teal.withOpacity(0.35))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Text('⭐', style: TextStyle(fontSize: 13)),
            const SizedBox(width: 6),
            Text(l10n.ritualsSuggestedNow, style: const TextStyle(color: AppColors.teal, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.3)),
          ]),
          const SizedBox(height: 12),
          Text(ritual.emoji, style: const TextStyle(fontSize: 36)),
          const SizedBox(height: 8),
          Text(ritual.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(l10n.ritualsMinutes(ritual.durationMin), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.teal.withOpacity(0.7))),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => context.go(Routes.session), child: Text(l10n.ritualsStartThis))),
        ],
      ),
    );
  }
}

class _RitualTile extends StatelessWidget {
  final RitualItem ritual;
  final AppLocalizations l10n;
  const _RitualTile({required this.ritual, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.go(Routes.session),
      tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.07))),
      leading: Text(ritual.emoji, style: const TextStyle(fontSize: 28)),
      title: Text(ritual.title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
      subtitle: Text(l10n.ritualsMinutes(ritual.durationMin), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.teal)),
      trailing: const Icon(Icons.play_circle_outline_rounded, color: AppColors.teal, size: 28),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
