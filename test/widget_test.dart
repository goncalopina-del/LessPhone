import 'package:flutter_test/flutter_test.dart';

import 'package:present_app/features/rituals/data/ritual_model.dart';

void main() {
  test('RitualItem resolves hyphenated DB locale keys (pt-PT from pt_PT)', () {
    final json = {
      'id': '1',
      'category': 'meal',
      'title_i18n': {'pt-PT': 'Jantar sem ecrãs', 'en': 'Screen-free dinner'},
      'duration_min': 45,
    };
    final ritual = RitualItem.fromJson(json, 'pt_PT');
    expect(ritual.title, 'Jantar sem ecrãs');
  });

  test('RitualItem falls back to language-only then english', () {
    final json = {
      'id': '2',
      'category': 'meal',
      'title_i18n': {'pt-PT': 'Jantar', 'en': 'Screen-free dinner'},
      'duration_min': 45,
    };
    expect(RitualItem.fromJson(json, 'pt_BR').title, 'Jantar');
    expect(RitualItem.fromJson({'id': '3', 'category': 'meal', 'title_i18n': {'en': 'Dinner'}, 'duration_min': 30}, 'fr_FR').title, 'Dinner');
  });
}
