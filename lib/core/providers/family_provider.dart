import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_provider.dart';
import '../database/supabase_client.dart';

class MemberPresence {
  final String userId;
  final String displayName;
  final String? avatarUrl;
  final bool isOnline;

  const MemberPresence({
    required this.userId,
    required this.displayName,
    this.avatarUrl,
    required this.isOnline,
  });

  String get initial => displayName.isNotEmpty ? displayName[0].toUpperCase() : '?';
}

class FamilyData {
  final String groupId;
  final String name;
  final String inviteCode;
  final String adminUserId;
  final List<MemberPresence> members;

  const FamilyData({
    required this.groupId,
    required this.name,
    required this.inviteCode,
    required this.adminUserId,
    required this.members,
  });

  int get onlineCount => members.where((m) => m.isOnline).length;
}

final familyPresenceProvider = FutureProvider<FamilyData?>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return null;

  final memberRow = await supabase
      .from('family_members')
      .select('family_group_id, family_groups(id, name, invite_code, admin_user_id)')
      .eq('user_id', user.id)
      .eq('status', 'active')
      .maybeSingle();

  if (memberRow == null) return null;

  final group = memberRow['family_groups'] as Map<String, dynamic>;
  final groupId = group['id'] as String;

  final rows = await supabase
      .from('family_members')
      .select('user_id, last_seen_at, users(display_name, avatar_url)')
      .eq('family_group_id', groupId)
      .eq('status', 'active')
      .order('joined_at');

  final now = DateTime.now();

  final members = (rows as List<dynamic>).map((r) {
    final raw = r as Map<String, dynamic>;
    final u = raw['users'] as Map<String, dynamic>? ?? {};
    final lastSeenStr = raw['last_seen_at'] as String?;
    final lastSeen = lastSeenStr != null ? DateTime.tryParse(lastSeenStr) : null;
    final isOnline = lastSeen != null && now.difference(lastSeen).inMinutes < 5;

    return MemberPresence(
      userId: raw['user_id'] as String,
      displayName: u['display_name'] as String? ?? '?',
      avatarUrl: u['avatar_url'] as String?,
      isOnline: isOnline,
    );
  }).toList();

  return FamilyData(
    groupId: groupId,
    name: group['name'] as String,
    inviteCode: group['invite_code'] as String,
    adminUserId: group['admin_user_id'] as String,
    members: members,
  );
});
