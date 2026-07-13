import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/auth_provider.dart';
import '../../../core/database/supabase_client.dart';
import '../../../core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/widgets/present_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class _FamilyMember {
  final String userId;
  final String displayName;
  final String role;
  final String status;
  final int weeklyScore;

  const _FamilyMember({required this.userId, required this.displayName, required this.role, required this.status, required this.weeklyScore});

  String get initial => displayName.isNotEmpty ? displayName[0].toUpperCase() : '?';
  bool get isPending => status == 'invited';
}

class _FullFamilyData {
  final String groupId;
  final String name;
  final String inviteCode;
  final String adminUserId;
  final List<_FamilyMember> members;
  const _FullFamilyData({required this.groupId, required this.name, required this.inviteCode, required this.adminUserId, required this.members});
}

final _fullFamilyProvider = FutureProvider<_FullFamilyData?>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return null;

  final mRow = await supabase
      .from('family_members')
      .select('family_group_id, family_groups(id, name, invite_code, admin_user_id)')
      .eq('user_id', user.id)
      .eq('status', 'active')
      .maybeSingle();

  if (mRow == null) return null;
  final group = mRow['family_groups'] as Map<String, dynamic>;
  final groupId = group['id'] as String;

  final rows = await supabase.from('family_members').select('user_id, role, status, users(display_name)').eq('family_group_id', groupId).order('joined_at');

  final scores = await supabase.rpc('get_member_scores_this_week', params: {'p_family_group_id': groupId});
  final scoreMap = <String, int>{};
  for (final s in scores as List<dynamic>) {
    scoreMap[s['user_id'] as String] = (s['score'] as num).toInt();
  }

  final members = (rows as List<dynamic>).map((r) {
    final raw = r as Map<String, dynamic>;
    final u = raw['users'] as Map<String, dynamic>? ?? {};
    final uid = raw['user_id'] as String;
    return _FamilyMember(userId: uid, displayName: u['display_name'] as String? ?? '?', role: raw['role'] as String? ?? 'adult', status: raw['status'] as String? ?? 'active', weeklyScore: scoreMap[uid] ?? 0);
  }).toList();

  return _FullFamilyData(groupId: groupId, name: group['name'] as String, inviteCode: group['invite_code'] as String, adminUserId: group['admin_user_id'] as String, members: members);
});

class FamilyScreen extends ConsumerWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentId = ref.watch(currentUserProvider)?.id ?? '';
    final async = ref.watch(_fullFamilyProvider);

    return Scaffold(
      body: SafeArea(
        child: async.when(
          loading: () => const Center(child: CircularProgressIndicator(color: AppColors.teal, strokeWidth: 2)),
          error: (_, __) => Center(child: Text(l10n.errorGeneric)),
          data: (family) {
            if (family == null) return Center(child: Text(l10n.setupFamilyTitle));
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                  sliver: SliverToBoxAdapter(child: Text(l10n.familyTitle, style: Theme.of(context).textTheme.headlineMedium)),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Text(l10n.familyMembers(family.members.length), style: Theme.of(context).textTheme.labelMedium?.copyWith(letterSpacing: 0.5)),
                      const SizedBox(height: 12),
                      ...family.members.asMap().entries.map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _MemberTile(member: e.value, currentUserId: currentId, l10n: l10n),
                      ).animate().fadeIn(delay: (60 * e.key).ms, duration: 350.ms)),
                      const SizedBox(height: 16),
                      OutlinedButton.icon(
                        onPressed: () => _showInviteSheet(context, l10n, family.groupId),
                        icon: const Icon(Icons.person_add_outlined),
                        label: Text(l10n.familyInviteMember),
                        style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 52), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                      ).animate().fadeIn(delay: 240.ms, duration: 350.ms),
                      const SizedBox(height: 12),
                      TextButton.icon(
                        onPressed: () async {
                          final link = 'https://present.app/join/${family.inviteCode}';
                          await Clipboard.setData(ClipboardData(text: link));
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.familyInviteLinkCopied), backgroundColor: AppColors.teal));
                          }
                        },
                        icon: const Icon(Icons.link_rounded),
                        label: Text(l10n.familyInviteLink),
                      ).animate().fadeIn(delay: 280.ms, duration: 350.ms),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            final link = 'https://present.app/join/${family.inviteCode}';
                            final text = Uri.encodeComponent('${l10n.familyInviteLink}: $link');
                            final url = Uri.parse('https://wa.me/?text=$text');
                            try {
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url, mode: LaunchMode.externalApplication);
                              }
                            } catch (_) {}
                          },
                          icon: const Icon(Icons.share_outlined),
                          label: Text(l10n.familyInviteShareWhatsApp),
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.teal, minimumSize: const Size(double.infinity, 52), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                        ),
                      ).animate().fadeIn(delay: 320.ms, duration: 350.ms),
                    ]),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showInviteSheet(BuildContext context, AppLocalizations l10n, String groupId) {
    final ctrl = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 24, left: 24, right: 24, top: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.setupInviteTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            PresentTextField(controller: ctrl, hintText: l10n.setupInviteEmailHint, keyboardType: TextInputType.emailAddress, autofocus: true),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final email = ctrl.text.trim();
                  if (email.isEmpty) return;
                  await supabase.functions.invoke('create-family-invite', body: {'action': 'invite', 'family_group_id': groupId, 'emails': [email]});
                  if (ctx.mounted) Navigator.pop(ctx);
                },
                child: Text(l10n.setupCreateFamily),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  final _FamilyMember member;
  final String currentUserId;
  final AppLocalizations l10n;

  const _MemberTile({required this.member, required this.currentUserId, required this.l10n});

  Color get _color => switch (member.role) {
    'admin' => AppColors.teal,
    'young' => AppColors.amber,
    _ => AppColors.violet,
  };

  String _roleLabel(AppLocalizations l10n) => switch (member.role) {
    'admin' => l10n.familyRoleAdmin,
    'young' => l10n.familyRoleYoung,
    _ => l10n.familyRoleAdult,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.07)),
      ),
      child: Row(
        children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(shape: BoxShape.circle, color: _color.withOpacity(0.15), border: Border.all(color: _color.withOpacity(0.4), width: 2)),
            child: Center(child: Text(member.initial, style: TextStyle(color: _color, fontSize: 18, fontWeight: FontWeight.w700))),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(member.displayName, style: Theme.of(context).textTheme.titleSmall),
                  if (member.userId == currentUserId) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(color: AppColors.teal.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                      child: const Text('you', style: TextStyle(color: AppColors.teal, fontSize: 9, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ]),
                const SizedBox(height: 3),
                Row(children: [
                  _Badge(label: _roleLabel(l10n), color: _color),
                  if (member.isPending) ...[const SizedBox(width: 6), _Badge(label: l10n.familyInvitePending, color: AppColors.amber)],
                ]),
              ],
            ),
          ),
          if (!member.isPending && member.weeklyScore > 0)
            Text(l10n.familyPointsLabel(member.weeklyScore), style: Theme.of(context).textTheme.labelMedium?.copyWith(color: _color, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;
  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
      child: Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w600)),
    );
  }
}
