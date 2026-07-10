class RitualItem {
  final String id;
  final String emoji;
  final String title;
  final int durationMin;
  final String category;

  static const _categoryEmoji = <String, String>{
    'meal': '🍽️',
    'outdoor': '🌿',
    'indoor': '🎲',
    'creative': '🎨',
    'reading': '📖',
  };

  const RitualItem({required this.id, required this.emoji, required this.title, required this.durationMin, required this.category});

  factory RitualItem.fromJson(Map<String, dynamic> json, String locale) {
    final category = (json['category'] as String?) ?? 'indoor';
    final titleI18n = (json['title_i18n'] as Map?) ?? {};
    final langOnly = locale.split('_').first;

    final localeAlt = locale.replaceAll('_', '-');
    final title = (titleI18n[locale] ??
        titleI18n[localeAlt] ??
        titleI18n[langOnly] ??
        titleI18n['en'] ??
        (titleI18n.isNotEmpty ? titleI18n.values.first : '')) as String;

    return RitualItem(
      id: json['id'] as String,
      emoji: _categoryEmoji[category] ?? '✨',
      title: title,
      durationMin: (json['duration_min'] as num?)?.toInt() ?? 30,
      category: category,
    );
  }
}
