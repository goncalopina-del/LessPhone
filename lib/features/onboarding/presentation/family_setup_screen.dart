import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/auth_provider.dart';
import '../../../core/database/supabase_client.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/present_text_field.dart';

class FamilySetupScreen extends ConsumerStatefulWidget {
  final String? inviteCode;
  const FamilySetupScreen({super.key, this.inviteCode});

  @override
  ConsumerState<FamilySetupScreen> createState() => _FamilySetupScreenState();
}

class _FamilySetupScreenState extends ConsumerState<FamilySetupScreen> {
  int _step = 0;
  bool _isLoading = false;
  String? _error;

  final _nameCtrl = TextEditingController();
  String _role = 'adult';
  final _familyNameCtrl = TextEditingController();
  final List<TextEditingController> _inviteCtrls = [TextEditingController()];

  @override
  void initState() {
    super.initState();
    if (widget.inviteCode != null) {
      _joinViaInvite(widget.inviteCode!);
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _familyNameCtrl.dispose();
    for (final c in _inviteCtrls) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _joinViaInvite(String code) async {
    setState(() => _isLoading = true);
    try {
      await supabase.functions.invoke('create-family-invite', body: {'action': 'join', 'invite_code': code});
      if (mounted) context.go(Routes.home);
    } catch (_) {
      if (mounted) setState(() { _error = AppLocalizations.of(context).errorGeneric; _isLoading = false; });
    }
  }

  Future<void> _next() async {
    if (_step < 2) {
      if (_step == 0 && _nameCtrl.text.trim().isEmpty) return;
      if (_step == 1 && _familyNameCtrl.text.trim().isEmpty) return;
      setState(() => _step++);
      return;
    }
    await _createFamily();
  }

  Future<void> _createFamily() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      final user = ref.read(currentUserProvider);
      if (user == null) throw StateError('No authenticated user');

      await supabase.from('users').update({'display_name': _nameCtrl.text.trim(), 'role': _role}).eq('id', user.id);

      final family = await supabase.from('family_groups').insert({
        'name': _familyNameCtrl.text.trim(),
        'admin_user_id': user.id,
      }).select().single();

      await supabase.from('family_members').insert({
        'user_id': user.id,
        'family_group_id': family['id'],
        'role': 'admin',
        'status': 'active',
      });

      final emails = _inviteCtrls.map((c) => c.text.trim()).where((e) => e.isNotEmpty).toList();
      if (emails.isNotEmpty) {
        await supabase.functions.invoke('create-family-invite', body: {
          'action': 'invite',
          'family_group_id': family['id'],
          'emails': emails,
        });
      }

      if (mounted) context.go(Routes.home);
    } catch (_) {
      if (mounted) setState(() => _error = AppLocalizations.of(context).errorGeneric);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (widget.inviteCode != null && _isLoading && _error == null) {
      return const Scaffold(backgroundColor: AppColors.ink, body: Center(child: CircularProgressIndicator(color: AppColors.teal)));
    }

    return Scaffold(
      backgroundColor: AppColors.ink,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(3, (i) => Expanded(
                  child: Container(
                    height: 4,
                    margin: EdgeInsets.only(right: i < 2 ? 6 : 0),
                    decoration: BoxDecoration(color: i <= _step ? AppColors.teal : AppColors.paper.withOpacity(0.15), borderRadius: BorderRadius.circular(2)),
                  ),
                )),
              ),
              const SizedBox(height: 8),
              Text(l10n.setupStep(_step + 1, 3), style: TextStyle(color: AppColors.paper.withOpacity(0.4), fontSize: 12, fontFamily: 'PlusJakartaSans')),
              const SizedBox(height: 40),
              AnimatedSwitcher(duration: const Duration(milliseconds: 250), child: _stepContent(l10n)),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(_error!, style: const TextStyle(color: AppColors.rose, fontSize: 13)),
              ],
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _next,
                  child: _isLoading
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : Text(_step < 2 ? l10n.continueButton : l10n.setupCreateFamily),
                ),
              ),
              if (_step == 2) ...[
                const SizedBox(height: 12),
                Center(
                  child: TextButton(
                    onPressed: _isLoading ? null : _createFamily,
                    child: Text(l10n.setupCanInviteLater, style: TextStyle(color: AppColors.paper.withOpacity(0.35))),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _stepContent(AppLocalizations l10n) {
    return switch (_step) {
      0 => _Step1(key: const ValueKey('step1'), nameCtrl: _nameCtrl, role: _role, onRoleChanged: (r) => setState(() => _role = r), l10n: l10n),
      1 => _Step2(key: const ValueKey('step2'), familyNameCtrl: _familyNameCtrl, l10n: l10n),
      _ => _Step3(key: const ValueKey('step3'), controllers: _inviteCtrls, onAdd: () => setState(() => _inviteCtrls.add(TextEditingController())), l10n: l10n),
    };
  }
}

class _Step1 extends StatelessWidget {
  final TextEditingController nameCtrl;
  final String role;
  final ValueChanged<String> onRoleChanged;
  final AppLocalizations l10n;

  const _Step1({super.key, required this.nameCtrl, required this.role, required this.onRoleChanged, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.setupProfileTitle, style: const TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 28, color: AppColors.paper, fontWeight: FontWeight.w700)),
        const SizedBox(height: 28),
        PresentTextField(controller: nameCtrl, hintText: l10n.setupProfileNameHint, autofocus: true),
        const SizedBox(height: 20),
        Text(l10n.setupFamilyRole, style: TextStyle(color: AppColors.paper.withOpacity(0.5), fontSize: 13)),
        const SizedBox(height: 10),
        Row(children: [
          _RoleChip(label: l10n.setupRoleAdult, selected: role == 'adult', onTap: () => onRoleChanged('adult')),
          const SizedBox(width: 10),
          _RoleChip(label: l10n.setupRoleYoung, selected: role == 'young', onTap: () => onRoleChanged('young')),
        ]),
      ],
    );
  }
}

class _Step2 extends StatelessWidget {
  final TextEditingController familyNameCtrl;
  final AppLocalizations l10n;
  const _Step2({super.key, required this.familyNameCtrl, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.setupFamilyTitle, style: const TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 28, color: AppColors.paper, fontWeight: FontWeight.w700)),
        const SizedBox(height: 28),
        PresentTextField(controller: familyNameCtrl, hintText: l10n.setupFamilyHint, autofocus: true),
      ],
    );
  }
}

class _Step3 extends StatelessWidget {
  final List<TextEditingController> controllers;
  final VoidCallback onAdd;
  final AppLocalizations l10n;
  const _Step3({super.key, required this.controllers, required this.onAdd, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.setupInviteTitle, style: const TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 28, color: AppColors.paper, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Text(l10n.setupInviteSubtitle, style: TextStyle(color: AppColors.paper.withOpacity(0.4))),
        const SizedBox(height: 24),
        ...controllers.map((c) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: PresentTextField(controller: c, hintText: l10n.setupInviteEmailHint, keyboardType: TextInputType.emailAddress),
        )),
        if (controllers.length < 7) ...[
          const SizedBox(height: 4),
          TextButton(onPressed: onAdd, child: Text(l10n.setupInviteAddAnother)),
        ],
      ],
    );
  }
}

class _RoleChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _RoleChip({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.teal.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: selected ? AppColors.teal : AppColors.paper.withOpacity(0.2)),
        ),
        child: Text(label, style: TextStyle(color: selected ? AppColors.teal : AppColors.paper.withOpacity(0.5), fontWeight: selected ? FontWeight.w600 : FontWeight.w400)),
      ),
    );
  }
}
