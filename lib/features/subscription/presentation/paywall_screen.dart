import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/app_localizations.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  int _selectedPlan = 0;
  bool _isLoading = false;

  Future<void> _purchase() async {
    final l10n = AppLocalizations.of(context);
    setState(() => _isLoading = true);
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      if (current == null) {
        throw PlatformException(message: 'No offerings configured', code: 'no_offerings');
      }

      final pkg = _selectedPlan == 0 ? (current.annual ?? current.monthly) : current.monthly;
      if (pkg == null) {
        throw PlatformException(message: 'No package found', code: 'no_package');
      }

      await Purchases.purchasePackage(pkg);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Subscription activated!'), backgroundColor: AppColors.teal));
        context.go(Routes.home);
      }
    } on PlatformException catch (e) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
        if (mounted) setState(() => _isLoading = false);
        return;
      }
      _showError(l10n.errorGeneric);
    } catch (_) {
      _showError(l10n.errorGeneric);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _restore() async {
    setState(() => _isLoading = true);
    try {
      await Purchases.restorePurchases();
      if (mounted) context.go(Routes.home);
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showError(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), backgroundColor: AppColors.rose));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.ink,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(icon: Icon(Icons.close, color: AppColors.paper.withOpacity(0.4)), onPressed: () => context.pop()),
              ),
              const SizedBox(height: 4),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(color: AppColors.teal.withOpacity(0.15), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.teal.withOpacity(0.4))),
                  child: Text(l10n.paywallTrialBadge, style: const TextStyle(color: AppColors.teal, fontSize: 13, fontWeight: FontWeight.w600)),
                ),
              ).animate().fadeIn(duration: 400.ms),
              const SizedBox(height: 20),
              Text(l10n.paywallTitle, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 34, color: AppColors.paper, fontWeight: FontWeight.w700))
                  .animate().fadeIn(delay: 80.ms, duration: 400.ms),
              const SizedBox(height: 8),
              Text(l10n.paywallSubtitle, textAlign: TextAlign.center, style: TextStyle(color: AppColors.paper.withOpacity(0.5), fontSize: 15))
                  .animate().fadeIn(delay: 140.ms, duration: 400.ms),
              const SizedBox(height: 32),
              _PlanCard(title: l10n.paywallPlanFamily, desc: l10n.paywallPlanFamilyDesc, price: '€4.99', period: l10n.paywallPerMonth, isFamily: true, selected: _selectedPlan == 0, onTap: () => setState(() => _selectedPlan = 0))
                  .animate().fadeIn(delay: 200.ms, duration: 400.ms),
              const SizedBox(height: 12),
              _PlanCard(title: l10n.paywallPlanIndividual, desc: l10n.paywallPlanIndividualDesc, price: '€2.49', period: l10n.paywallPerMonth, isFamily: false, selected: _selectedPlan == 1, onTap: () => setState(() => _selectedPlan = 1))
                  .animate().fadeIn(delay: 260.ms, duration: 400.ms),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.inkSurface, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.paper.withOpacity(0.07))),
                child: Text(l10n.paywallVsBuiltIn, textAlign: TextAlign.center, style: TextStyle(color: AppColors.paper.withOpacity(0.45), fontSize: 13, height: 1.55)),
              ).animate().fadeIn(delay: 320.ms, duration: 400.ms),
              const SizedBox(height: 24),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _purchase,
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.teal, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  child: _isLoading
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : Text(l10n.paywallStartTrial, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                ),
              ).animate().fadeIn(delay: 380.ms, duration: 400.ms),
              const SizedBox(height: 10),
              Center(child: Text(l10n.paywallNoCard, style: TextStyle(color: AppColors.paper.withOpacity(0.3), fontSize: 12))),
              const SizedBox(height: 8),
              Center(child: TextButton(onPressed: () => context.pop(), child: Text(l10n.paywallMaybeLater, style: TextStyle(color: AppColors.paper.withOpacity(0.3))))),
              Center(child: TextButton(onPressed: _isLoading ? null : _restore, child: Text(l10n.paywallRestorePurchases, style: TextStyle(color: AppColors.paper.withOpacity(0.25), fontSize: 12)))),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String title;
  final String desc;
  final String price;
  final String period;
  final bool isFamily;
  final bool selected;
  final VoidCallback onTap;

  const _PlanCard({required this.title, required this.desc, required this.price, required this.period, required this.isFamily, required this.selected, required this.onTap});

  static const _familyFeatures = ['Unlimited sessions — all members', 'Offline Score + percentile', 'Full history', 'Premium insights', 'Family diary'];
  static const _individualFeatures = ['Unlimited solo sessions', 'Personal score + history', 'Can join a paid family later'];

  @override
  Widget build(BuildContext context) {
    final features = isFamily ? _familyFeatures : _individualFeatures;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: selected ? AppColors.teal.withOpacity(0.1) : AppColors.inkSurface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: selected ? AppColors.teal : AppColors.paper.withOpacity(0.1), width: selected ? 1.5 : 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(color: AppColors.paper, fontSize: 16, fontWeight: FontWeight.w700)),
                    Text(desc, style: TextStyle(color: AppColors.paper.withOpacity(0.45), fontSize: 13)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: price, style: TextStyle(color: selected ? AppColors.teal : AppColors.paper, fontSize: 22, fontWeight: FontWeight.w800, fontFamily: 'PlayfairDisplay')),
                  TextSpan(text: period, style: TextStyle(color: AppColors.paper.withOpacity(0.4), fontSize: 12)),
                ]),
              ),
            ]),
            if (selected) ...[
              const SizedBox(height: 14),
              const Divider(color: AppColors.teal, thickness: 0.3),
              const SizedBox(height: 10),
              ...features.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(children: [
                  const Icon(Icons.check_rounded, color: AppColors.teal, size: 16),
                  const SizedBox(width: 8),
                  Expanded(child: Text(f, style: TextStyle(color: AppColors.paper.withOpacity(0.7), fontSize: 13))),
                ]),
              )),
            ],
          ],
        ),
      ),
    );
  }
}
