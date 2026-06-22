import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/app_localizations.dart';

enum _SlideId { problem, solution, how, start }

class _Slide {
  final String emoji;
  final _SlideId id;
  const _Slide(this.emoji, this.id);
}

const _slides = [
  _Slide('📱', _SlideId.problem),
  _Slide('🌿', _SlideId.solution),
  _Slide('▶️', _SlideId.how),
  _Slide('👨‍👩‍👧‍👦', _SlideId.start),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;
  int _familyCount = 0;

  @override
  void initState() {
    super.initState();
    _loadCount();
  }

  Future<void> _loadCount() async {
    try {
      final res = await Supabase.instance.client
          .from('family_groups')
          .select('id')
          .limit(1)
          .count(CountOption.exact);
      if (mounted && res.count != null) {
        setState(() => _familyCount = res.count!);
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_page < _slides.length - 1) {
      _controller.nextPage(duration: const Duration(milliseconds: 320), curve: Curves.easeInOut);
    } else {
      context.go(Routes.auth);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isLast = _page == _slides.length - 1;

    return Scaffold(
      backgroundColor: AppColors.ink,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  ...List.generate(_slides.length, (i) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: i == _page ? 24 : 6,
                      height: 6,
                      margin: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        color: i == _page ? AppColors.teal : AppColors.paper.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                  const Spacer(),
                  if (!isLast)
                    TextButton(
                      onPressed: () => context.go(Routes.auth),
                      child: Text(l10n.skipButton, style: TextStyle(color: AppColors.paper.withOpacity(0.4))),
                    ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (p) => setState(() => _page = p),
                itemCount: _slides.length,
                itemBuilder: (_, i) => _SlidePage(slide: _slides[i], l10n: l10n, familyCount: _familyCount),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _next,
                      child: Text(isLast ? l10n.onboardingStartCta : l10n.continueButton),
                    ),
                  ),
                  if (isLast) ...[
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => context.go(Routes.auth),
                      child: Text(l10n.onboardingAlreadyHaveAccount, style: TextStyle(color: AppColors.paper.withOpacity(0.45))),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SlidePage extends StatelessWidget {
  final _Slide slide;
  final AppLocalizations l10n;
  final int familyCount;

  const _SlidePage({required this.slide, required this.l10n, required this.familyCount});

  String _title() => switch (slide.id) {
        _SlideId.problem => l10n.onboardingProblemTitle,
        _SlideId.solution => l10n.onboardingSolutionTitle,
        _SlideId.how => l10n.onboardingHowTitle,
        _SlideId.start => l10n.onboardingStartTitle,
      };

  String _body() => switch (slide.id) {
        _SlideId.problem => l10n.onboardingProblemBody,
        _SlideId.solution => l10n.onboardingSolutionBody,
        _SlideId.how => l10n.onboardingHowSteps,
        _SlideId.start => familyCount > 0 ? l10n.onboardingFamiliesCount(familyCount) : '',
      };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(slide.emoji, style: const TextStyle(fontSize: 80)).animate().scale(duration: 500.ms, curve: Curves.elasticOut),
          const SizedBox(height: 40),
          Text(_title(), textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.paper, height: 1.2))
              .animate().fadeIn(delay: 150.ms, duration: 400.ms),
          const SizedBox(height: 20),
          if (_body().isNotEmpty)
            Text(_body(), textAlign: TextAlign.center, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 16, color: AppColors.paper.withOpacity(0.55), height: 1.65))
                .animate().fadeIn(delay: 250.ms, duration: 400.ms),
        ],
      ),
    );
  }
}
