import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/app_localizations.dart';

class SessionCompleteExtra {
  final int durationMinutes;
  final int scoreEarned;
  const SessionCompleteExtra({required this.durationMinutes, required this.scoreEarned});
}

class SessionCompleteScreen extends StatefulWidget {
  final SessionCompleteExtra? extra;
  const SessionCompleteScreen({super.key, this.extra});

  @override
  State<SessionCompleteScreen> createState() => _SessionCompleteScreenState();
}

class _SessionCompleteScreenState extends State<SessionCompleteScreen> {
  String? _selectedEmoji;
  static const _emojis = ['😊', '😂', '❤️', '😴', '🌟'];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final duration = widget.extra?.durationMinutes ?? 0;
    final score = widget.extra?.scoreEarned ?? 0;

    return Scaffold(
      backgroundColor: AppColors.ink,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const Spacer(),
              const Text('🎉', style: TextStyle(fontSize: 72)).animate().scale(delay: 100.ms, duration: 500.ms, curve: Curves.elasticOut),
              const SizedBox(height: 24),
              Text(l10n.sessionCompletedTitle, style: const TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.paper))
                  .animate().fadeIn(delay: 300.ms, duration: 400.ms),
              const SizedBox(height: 8),
              Text(l10n.diarySessionDuration(duration), style: TextStyle(color: AppColors.paper.withOpacity(0.5), fontSize: 15))
                  .animate().fadeIn(delay: 360.ms, duration: 400.ms),
              const SizedBox(height: 24),
              if (score > 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(color: AppColors.teal.withOpacity(0.15), borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.teal.withOpacity(0.4))),
                  child: Text(l10n.sessionCompletedScore(score), style: const TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 32, color: AppColors.teal, fontWeight: FontWeight.w900)),
                ).animate().fadeIn(delay: 440.ms, duration: 400.ms).slideY(begin: 0.12),
              const Spacer(),
              Text(l10n.sessionDiaryPrompt, style: const TextStyle(color: AppColors.paper, fontSize: 16, fontWeight: FontWeight.w600))
                  .animate().fadeIn(delay: 580.ms, duration: 400.ms),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _emojis.map((emoji) {
                  final selected = _selectedEmoji == emoji;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedEmoji = emoji),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: 54, height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selected ? AppColors.teal.withOpacity(0.2) : Colors.white.withOpacity(0.05),
                        border: Border.all(color: selected ? AppColors.teal : Colors.transparent, width: 2),
                      ),
                      child: Center(child: Text(emoji, style: const TextStyle(fontSize: 28))),
                    ),
                  );
                }).toList(),
              ).animate().fadeIn(delay: 650.ms, duration: 400.ms),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => context.go(Routes.home), child: Text(l10n.doneButton)),
              ).animate().fadeIn(delay: 720.ms, duration: 400.ms),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.go(Routes.home),
                child: Text(l10n.skipButton, style: TextStyle(color: AppColors.paper.withOpacity(0.3))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
