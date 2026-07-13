import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_provider.dart';
import '../../../core/database/supabase_client.dart';
import '../../../core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class _DashboardData {
  final int score;
  final int percentile;
  final int totalMinutes;
  final int sessionCount;
  final int streakDays;
  final int bestSessionMinutes;
  final List<double> weekBars;

  const _DashboardData({
    required this.score,
    required this.percentile,
    required this.totalMinutes,
    required this.sessionCount,
    required this.streakDays,
    required this.bestSessionMinutes,
    required this.weekBars,
  });

  static const empty = _DashboardData(score: 0, percentile: 0, totalMinutes: 0, sessionCount: 0, streakDays: 0, bestSessionMinutes: 0, weekBars: [0, 0, 0, 0, 0, 0, 0]);
}

final _dashboardProvider = FutureProvider.family<_DashboardData, int>((ref, period) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return _DashboardData.empty;

  final scoreResult = await supabase.rpc('get_weekly_score', params: {'p_user_id': user.id});
  final scoreMap = scoreResult as Map<String, dynamic>? ?? {};

  final now = DateTime.now();
  final monday = now.subtract(Duration(days: now.weekday - 1));
  final weekStart = DateTime(monday.year, monday.month, monday.day);

  final sessions = await supabase
      .from('present_sessions')
      .select('started_at, duration_minutes, score_earned')
      .eq('status', 'completed')
      .gte('started_at', weekStart.toIso8601String())
      .order('started_at');

  final bars = List<double>.filled(7, 0);
  int totalMin = 0;
  int bestMin = 0;

  for (final s in sessions as List<dynamic>) {
    final raw = s as Map<String, dynamic>;
    final started = DateTime.tryParse(raw['started_at'] as String? ?? '');
    final dur = (raw['duration_minutes'] as num?)?.toInt() ?? 0;
    if (started != null) {
      final dayIndex = started.weekday - 1;
      if (dayIndex >= 0 && dayIndex < 7) bars[dayIndex] += dur.toDouble();
    }
    totalMin += dur;
    if (dur > bestMin) bestMin = dur;
  }

  int streak = 0;
  final checked = DateTime(now.year, now.month, now.day);
  for (int d = 0; d < 365; d++) {
    final day = checked.subtract(Duration(days: d));
    final next = day.add(const Duration(days: 1));
    final countResult = await supabase
        .from('present_sessions')
        .select('id')
        .eq('status', 'completed')
        .gte('started_at', day.toIso8601String())
        .lt('started_at', next.toIso8601String())
        .count(CountOption.exact);
    if ((countResult.count ?? 0) > 0) {
      streak++;
    } else {
      break;
    }
  }

  return _DashboardData(
    score: (scoreMap['score'] as num?)?.toInt() ?? 0,
    percentile: (scoreMap['percentile'] as num?)?.toInt() ?? 0,
    totalMinutes: totalMin,
    sessionCount: (sessions as List).length,
    streakDays: streak,
    bestSessionMinutes: bestMin,
    weekBars: bars,
  );
});

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _period = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final async = ref.watch(_dashboardProvider(_period));

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              sliver: SliverToBoxAdapter(child: Text(l10n.dashboardTitle, style: Theme.of(context).textTheme.headlineMedium)),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  async.when(
                    loading: () => const SizedBox(height: 200, child: Center(child: CircularProgressIndicator(color: AppColors.teal, strokeWidth: 2))),
                    error: (_, __) => Center(child: Text(l10n.errorGeneric)),
                    data: (data) => Column(
                      children: [
                        _ScoreHero(data: data, l10n: l10n).animate().fadeIn(delay: 60.ms),
                        const SizedBox(height: 20),
                        _PeriodSelector(
                          selected: _period,
                          labels: [l10n.dashboardPeriodWeek, l10n.dashboardPeriodMonth, l10n.dashboardPeriodAll],
                          onChanged: (i) => setState(() => _period = i),
                        ).animate().fadeIn(delay: 120.ms),
                        const SizedBox(height: 20),
                        _WeekChart(bars: data.weekBars).animate().fadeIn(delay: 180.ms),
                        const SizedBox(height: 24),
                        _StatsGrid(data: data, l10n: l10n).animate().fadeIn(delay: 240.ms),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScoreHero extends StatelessWidget {
  final _DashboardData data;
  final AppLocalizations l10n;
  const _ScoreHero({required this.data, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.teal.withOpacity(0.15), AppColors.teal.withOpacity(0.03)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.teal.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.dashboardOfflineScore, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.teal)),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${data.score}', style: Theme.of(context).textTheme.displayLarge?.copyWith(color: AppColors.teal, fontWeight: FontWeight.w900)),
              const SizedBox(width: 12),
              if (data.percentile > 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: AppColors.violet.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                    child: Text(l10n.dashboardPercentile(data.percentile), style: const TextStyle(color: AppColors.violet, fontSize: 12, fontWeight: FontWeight.w600)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PeriodSelector extends StatelessWidget {
  final int selected;
  final List<String> labels;
  final ValueChanged<int> onChanged;
  const _PeriodSelector({required this.selected, required this.labels, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: List.generate(labels.length, (i) {
          final active = i == selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: active ? AppColors.teal : Colors.transparent, borderRadius: BorderRadius.circular(9)),
                child: Text(
                  labels[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: active ? Colors.white : Theme.of(context).colorScheme.onSurface.withOpacity(0.45), fontSize: 13, fontWeight: FontWeight.w600, fontFamily: 'PlusJakartaSans'),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _WeekChart extends StatelessWidget {
  final List<double> bars;
  const _WeekChart({required this.bars});

  static const _labels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  Widget build(BuildContext context) {
    final maxY = bars.fold(0.0, (a, b) => b > a ? b : a);
    final chartMax = maxY < 30 ? 60.0 : maxY * 1.25;

    return SizedBox(
      height: 160,
      child: BarChart(
        BarChartData(
          maxY: chartMax,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) {
                  final i = v.toInt();
                  if (i < 0 || i >= _labels.length) return const SizedBox();
                  return Padding(padding: const EdgeInsets.only(top: 8), child: Text(_labels[i], style: TextStyle(fontSize: 11, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4))));
                },
              ),
            ),
          ),
          barGroups: List.generate(7, (i) {
            final val = i < bars.length ? bars[i] : 0.0;
            return BarChartGroupData(x: i, barRods: [BarChartRodData(toY: val, color: val > 30 ? AppColors.teal : AppColors.teal.withOpacity(0.3), width: 20, borderRadius: const BorderRadius.vertical(top: Radius.circular(6)))]);
          }),
        ),
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  final _DashboardData data;
  final AppLocalizations l10n;
  const _StatsGrid({required this.data, required this.l10n});

  String _fmt(int minutes) {
    if (minutes == 0) return '—';
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return h > 0 ? '${h}h ${m}m' : '${m}m';
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.6,
      children: [
        _StatCard(label: l10n.dashboardTimeTogether, value: _fmt(data.totalMinutes), icon: Icons.timer_outlined, color: AppColors.teal),
        _StatCard(label: l10n.dashboardSessions, value: '${data.sessionCount}', icon: Icons.play_circle_outline, color: AppColors.violet),
        _StatCard(label: l10n.dashboardStreak, value: data.streakDays > 0 ? '${data.streakDays} 🔥' : '—', icon: Icons.local_fire_department_outlined, color: AppColors.amber),
        _StatCard(label: l10n.dashboardBestSession, value: _fmt(data.bestSessionMinutes), icon: Icons.star_outline_rounded, color: AppColors.green),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  const _StatCard({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(16), border: Border.all(color: color.withOpacity(0.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color, fontWeight: FontWeight.w700)),
              Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color.withOpacity(0.7))),
            ],
          ),
        ],
      ),
    );
  }
}
