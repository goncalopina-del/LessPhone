import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/auth/auth_provider.dart';
import '../../../core/database/supabase_client.dart';
import '../../../core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiaryEntry {
  final String id;
  final String emoji;
  final String? note;
  final DateTime date;
  final int durationMinutes;
  final String? ritualTitle;

  const DiaryEntry({required this.id, required this.emoji, this.note, required this.date, required this.durationMinutes, this.ritualTitle});

  factory DiaryEntry.fromJson(Map<String, dynamic> json, String locale) {
    final session = json['present_sessions'] as Map<String, dynamic>? ?? {};
    final ritual = session['rituals'] as Map<String, dynamic>? ?? {};
    final titleI18n = (ritual['title_i18n'] as Map?) ?? {};
    final langOnly = locale.split('_').first;

    final title = (titleI18n[locale] ?? titleI18n[langOnly] ?? titleI18n['en'] ?? (titleI18n.isNotEmpty ? titleI18n.values.first : null)) as String?;

    return DiaryEntry(
      id: json['id'] as String,
      emoji: json['emoji'] as String? ?? '😊',
      note: json['note'] as String?,
      date: DateTime.parse(json['created_at'] as String),
      durationMinutes: (session['duration_minutes'] as num?)?.toInt() ?? 0,
      ritualTitle: title,
    );
  }
}

final _diaryProvider = FutureProvider.family<List<DiaryEntry>, String>((ref, locale) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];

  final rows = await supabase.from('diary_entries').select('''
        id, emoji, note, created_at,
        present_sessions(duration_minutes, rituals(title_i18n))
      ''').order('created_at', ascending: false).limit(50);

  return (rows as List<dynamic>).map((r) => DiaryEntry.fromJson(r as Map<String, dynamic>, locale)).toList();
});

class DiaryScreen extends ConsumerWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final async = ref.watch(_diaryProvider(locale));

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              sliver: SliverToBoxAdapter(child: Text(l10n.diaryTitle, style: Theme.of(context).textTheme.headlineMedium)),
            ),
            async.when(
              loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator(color: AppColors.teal, strokeWidth: 2))),
              error: (_, __) => SliverFillRemaining(child: Center(child: Text(l10n.errorGeneric))),
              data: (entries) {
                if (entries.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('📖', style: TextStyle(fontSize: 56)),
                            const SizedBox(height: 16),
                            Text(l10n.diaryNoEntries, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: context.pc.muted), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, i) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _DiaryCard(entry: entries[i], locale: locale, l10n: l10n),
                      ).animate().fadeIn(delay: (60 * i).ms, duration: 350.ms).slideY(begin: 0.06),
                      childCount: entries.length,
                    ),
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

class _DiaryCard extends StatelessWidget {
  final DiaryEntry entry;
  final String locale;
  final AppLocalizations l10n;
  const _DiaryCard({required this.entry, required this.locale, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat.yMMMMd(locale).format(entry.date);
    final timeStr = DateFormat.Hm(locale).format(entry.date);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(18), border: Border.all(color: AppColors.teal.withOpacity(0.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(entry.emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.ritualTitle ?? '', style: Theme.of(context).textTheme.titleSmall),
                  Text('$dateStr · $timeStr', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: context.pc.muted)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: AppColors.teal.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
              child: Text(l10n.diarySessionDuration(entry.durationMinutes), style: const TextStyle(color: AppColors.teal, fontSize: 12, fontWeight: FontWeight.w600)),
            ),
          ]),
          if (entry.note != null && entry.note!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(entry.note!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: context.pc.muted)),
          ],
        ],
      ),
    );
  }
}
