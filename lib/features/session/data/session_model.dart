enum SessionStatus { starting, active, completed, cancelled }

class SessionModel {
  final String id;
  final String familyGroupId;
  final String startedBy;
  final String? ritualId;
  final SessionStatus status;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int? durationMinutes;
  final int? scoreEarned;

  const SessionModel({
    required this.id,
    required this.familyGroupId,
    required this.startedBy,
    this.ritualId,
    this.status = SessionStatus.starting,
    required this.startedAt,
    this.endedAt,
    this.durationMinutes,
    this.scoreEarned,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      id: json['id'] as String,
      familyGroupId: json['family_group_id'] as String,
      startedBy: json['started_by'] as String,
      ritualId: json['ritual_id'] as String?,
      status: SessionStatus.values.firstWhere((s) => s.name == json['status'], orElse: () => SessionStatus.starting),
      startedAt: DateTime.parse(json['started_at'] as String),
      endedAt: json['ended_at'] != null ? DateTime.parse(json['ended_at'] as String) : null,
      durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
      scoreEarned: (json['score_earned'] as num?)?.toInt(),
    );
  }

  bool get isActive => status == SessionStatus.active;
  bool get isCompleted => status == SessionStatus.completed;
  Duration get elapsed => (endedAt ?? DateTime.now()).difference(startedAt);
  bool get meetsMinimum => elapsed.inMinutes >= 5;
}
