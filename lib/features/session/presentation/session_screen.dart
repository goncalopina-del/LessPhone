import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/database/supabase_client.dart';
import '../../../core/providers/family_provider.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'session_complete_screen.dart';

class SessionScreen extends ConsumerStatefulWidget {
  const SessionScreen({super.key});

  @override
  ConsumerState<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends ConsumerState<SessionScreen> with SingleTickerProviderStateMixin {
  late final Timer _ticker;
  late final AnimationController _pulse;

  int _seconds = 0;
  bool _showCheckIn = false;
  bool _ending = false;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _seconds++);
      if (_seconds > 0 && _seconds % 1200 == 0) {
        setState(() => _showCheckIn = true);
      }
    });
  }

  @override
  void dispose() {
    _ticker.cancel();
    _pulse.dispose();
    super.dispose();
  }

  String get _formatted {
    final h = _seconds ~/ 3600;
    final m = (_seconds % 3600) ~/ 60;
    final s = _seconds % 60;
    final mm = m.toString().padLeft(2, '0');
    final ss = s.toString().padLeft(2, '0');
    return h > 0 ? '${h.toString().padLeft(2, '0')}:$mm:$ss' : '$mm:$ss';
  }

  Future<void> _endSession() async {
    if (_ending) return;
    final l10n = AppLocalizations.of(context);
    final minutes = _seconds ~/ 60;

    if (minutes < 5) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.sessionMinimumNotMet), backgroundColor: AppColors.amber));
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l10n.sessionEndButton),
        content: Text(l10n.sessionEndConfirm(minutes)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.sessionKeepGoing)),
          ElevatedButton(onPressed: () => Navigator.pop(context, true), child: Text(l10n.sessionEndButton)),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    setState(() => _ending = true);
    _ticker.cancel();

    try {
      await supabase.functions.invoke('process-session-end', body: {'duration_minutes': minutes});
    } catch (_) {}

    final score = (minutes * 1.3).round().clamp(0, 300);

    if (mounted) {
      context.go(Routes.sessionComplete, extra: SessionCompleteExtra(durationMinutes: minutes, scoreEarned: score));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final familyAsync = ref.watch(familyPresenceProvider);
    final familyName = familyAsync.value?.name ?? '';

    return Scaffold(
      backgroundColor: AppColors.ink,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _pulse,
                builder: (_, __) => DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(center: Alignment.center, radius: 1.2, colors: [AppColors.teal.withOpacity(0.07 * _pulse.value), Colors.transparent]),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      TextButton(onPressed: () => context.pop(), child: Text(l10n.cancelButton, style: TextStyle(color: AppColors.paper.withOpacity(0.45)))),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: AppColors.teal.withOpacity(0.15), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.teal.withOpacity(0.4))),
                        child: Text(l10n.sessionTitle.toUpperCase(), style: const TextStyle(color: AppColors.teal, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (familyName.isNotEmpty)
                  Text(familyName, style: TextStyle(color: AppColors.paper.withOpacity(0.45), fontSize: 14, fontFamily: 'PlusJakartaSans')),
                const SizedBox(height: 12),
                Text(_formatted, style: const TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 64, fontWeight: FontWeight.w300, color: AppColors.teal, letterSpacing: 0.04)),
                const SizedBox(height: 8),
                Text(l10n.sessionMinutesTogether, style: TextStyle(color: AppColors.paper.withOpacity(0.4), fontSize: 14)),
                const SizedBox(height: 40),
                _ParticipantRow(members: familyAsync.value?.members ?? []),
                const Spacer(),
                if (_showCheckIn)
                  _CheckInCard(l10n: l10n, onYes: () => setState(() => _showCheckIn = false), onNo: () => setState(() => _showCheckIn = false)),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: OutlinedButton(
                    onPressed: _ending ? null : _endSession,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.paper.withOpacity(0.55),
                      side: BorderSide(color: AppColors.paper.withOpacity(0.2)),
                      minimumSize: const Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(l10n.sessionEndButton),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ParticipantRow extends StatelessWidget {
  final List<MemberPresence> members;
  const _ParticipantRow({required this.members});

  static const _colors = [AppColors.teal, AppColors.violet, AppColors.amber, AppColors.blue];

  @override
  Widget build(BuildContext context) {
    final visible = members.isEmpty
        ? [const _Bubble(initial: '?', color: AppColors.teal, active: true)]
        : members.take(5).toList().asMap().entries.map((e) => _Bubble(initial: e.value.initial, color: _colors[e.key % _colors.length], active: e.value.isOnline)).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (int i = 0; i < visible.length; i++) ...[if (i > 0) const SizedBox(width: 16), visible[i]]],
    );
  }
}

class _Bubble extends StatelessWidget {
  final String initial;
  final Color color;
  final bool active;
  const _Bubble({required this.initial, required this.color, required this.active});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52, height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? color.withOpacity(0.2) : Colors.white.withOpacity(0.05),
            border: Border.all(color: active ? color : Colors.white.withOpacity(0.15), width: 2),
          ),
          child: Center(child: Text(initial, style: TextStyle(color: active ? color : Colors.white.withOpacity(0.3), fontSize: 20, fontWeight: FontWeight.w700))),
        ),
        const SizedBox(height: 6),
        Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: active ? AppColors.green : Colors.white.withOpacity(0.15))),
      ],
    );
  }
}

class _CheckInCard extends StatelessWidget {
  final AppLocalizations l10n;
  final VoidCallback onYes;
  final VoidCallback onNo;
  const _CheckInCard({required this.l10n, required this.onYes, required this.onNo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.inkSurface, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.teal.withOpacity(0.3))),
      child: Column(
        children: [
          Text(l10n.sessionCheckInPrompt, style: const TextStyle(color: AppColors.paper, fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: ElevatedButton(onPressed: onYes, child: Text(l10n.sessionCheckInYes))),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: onNo,
                style: OutlinedButton.styleFrom(foregroundColor: AppColors.amber, side: const BorderSide(color: AppColors.amber)),
                child: Text(l10n.sessionCheckInNo),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
