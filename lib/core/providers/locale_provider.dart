import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _kLocaleKey = 'locale_lang';
const _kCountryKey = 'locale_country';

const supportedLocalesWithNames = <({Locale locale, String flag, String name, bool rtl})>[
  (locale: Locale('pt', 'PT'), flag: '🇵🇹', name: 'Português (Portugal)', rtl: false),
  (locale: Locale('pt', 'BR'), flag: '🇧🇷', name: 'Português (Brasil)',   rtl: false),
  (locale: Locale('en'),       flag: '🇬🇧', name: 'English',              rtl: false),
  (locale: Locale('zh'),       flag: '🇨🇳', name: '中文 (简体)',           rtl: false),
  (locale: Locale('hi'),       flag: '🇮🇳', name: 'हिन्दी',               rtl: false),
  (locale: Locale('es'),       flag: '🇪🇸', name: 'Español',              rtl: false),
  (locale: Locale('ar'),       flag: '🇸🇦', name: 'العربية',              rtl: true),
  (locale: Locale('fr'),       flag: '🇫🇷', name: 'Français',             rtl: false),
  (locale: Locale('bn'),       flag: '🇧🇩', name: 'বাংলা',                rtl: false),
  (locale: Locale('ru'),       flag: '🇷🇺', name: 'Русский',              rtl: false),
  (locale: Locale('id'),       flag: '🇮🇩', name: 'Bahasa Indonesia',     rtl: false),
];

const _rtlLanguages = <String>{'ar', 'he', 'fa', 'ur'};

bool isRtlLocale(Locale locale) => _rtlLanguages.contains(locale.languageCode);

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>(
  (ref) => LocaleNotifier(),
);

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(null) {
    _load();
  }

  void _load() {
    final box = Hive.box<String>('prefs');
    final lang = box.get(_kLocaleKey);
    final country = box.get(_kCountryKey);
    if (lang != null && lang.isNotEmpty) {
      state = Locale(lang, (country == null || country.isEmpty) ? null : country);
    }
  }

  Future<void> setLocale(Locale locale) async {
    final box = Hive.box<String>('prefs');
    await box.put(_kLocaleKey, locale.languageCode);
    await box.put(_kCountryKey, locale.countryCode ?? '');
    state = locale;
  }

  Future<void> resetToDevice() async {
    final box = Hive.box<String>('prefs');
    await box.delete(_kLocaleKey);
    await box.delete(_kCountryKey);
    state = null;
  }
}
