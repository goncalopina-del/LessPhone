import 'package:flutter/material.dart';

abstract final class AppColors {
  static const teal        = Color(0xFF0FB8A0);
  static const tealLight   = Color(0xFF4DD9C7);
  static const ink         = Color(0xFF0A0F1A);
  static const inkSurface  = Color(0xFF111827);
  static const inkSurface2 = Color(0xFF1A2332);
  static const paper       = Color(0xFFF5F0E8);
  static const paperWarm   = Color(0xFFFDFAF4);
  static const amber       = Color(0xFFF5A623);
  static const rose        = Color(0xFFE05C7A);
  static const violet      = Color(0xFF9B6DFF);
  static const green       = Color(0xFF4ADE80);
  static const blue        = Color(0xFF4A9EFF);
}

@immutable
class PresentColors extends ThemeExtension<PresentColors> {
  final Color teal;
  final Color amber;
  final Color rose;
  final Color violet;
  final Color green;
  final Color surface2;
  final Color muted;
  final Color dim;

  const PresentColors({
    required this.teal,
    required this.amber,
    required this.rose,
    required this.violet,
    required this.green,
    required this.surface2,
    required this.muted,
    required this.dim,
  });

  static const light = PresentColors(
    teal: AppColors.teal, amber: AppColors.amber, rose: AppColors.rose,
    violet: AppColors.violet, green: AppColors.green,
    surface2: AppColors.paperWarm,
    muted: Color(0x99111827), dim: Color(0x55111827),
  );

  static const dark = PresentColors(
    teal: AppColors.teal, amber: AppColors.amber, rose: AppColors.rose,
    violet: AppColors.violet, green: AppColors.green,
    surface2: AppColors.inkSurface2,
    muted: Color(0x99F5F0E8), dim: Color(0x55F5F0E8),
  );

  @override
  PresentColors copyWith({
    Color? teal, Color? amber, Color? rose, Color? violet, Color? green,
    Color? surface2, Color? muted, Color? dim,
  }) => PresentColors(
    teal: teal ?? this.teal,
    amber: amber ?? this.amber,
    rose: rose ?? this.rose,
    violet: violet ?? this.violet,
    green: green ?? this.green,
    surface2: surface2 ?? this.surface2,
    muted: muted ?? this.muted,
    dim: dim ?? this.dim,
  );

  @override
  PresentColors lerp(PresentColors? other, double t) {
    if (other == null) return this;
    return PresentColors(
      teal: Color.lerp(teal, other.teal, t)!,
      amber: Color.lerp(amber, other.amber, t)!,
      rose: Color.lerp(rose, other.rose, t)!,
      violet: Color.lerp(violet, other.violet, t)!,
      green: Color.lerp(green, other.green, t)!,
      surface2: Color.lerp(surface2, other.surface2, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      dim: Color.lerp(dim, other.dim, t)!,
    );
  }
}

abstract final class AppTheme {
  static const _body = 'PlusJakartaSans';
  static const _display = 'PlayfairDisplay';

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final primary = isDark ? AppColors.paper : AppColors.ink;
    final secondary = isDark ? const Color(0x99F5F0E8) : const Color(0x99111827);
    final surface = isDark ? AppColors.inkSurface : AppColors.paperWarm;
    final bg = isDark ? AppColors.ink : AppColors.paper;

    final colorScheme = isDark
        ? const ColorScheme.dark(
            primary: AppColors.teal, onPrimary: AppColors.ink,
            secondary: AppColors.violet, error: AppColors.rose,
            surface: AppColors.inkSurface, onSurface: AppColors.paper,
          )
        : const ColorScheme.light(
            primary: AppColors.teal, onPrimary: Colors.white,
            secondary: AppColors.violet, error: AppColors.rose,
            surface: AppColors.paperWarm, onSurface: AppColors.ink,
          );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: bg,
      textTheme: _textTheme(primary, secondary),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: primary,
        titleTextStyle: TextStyle(
          fontFamily: _body, fontSize: 18, fontWeight: FontWeight.w600, color: primary,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: primary.withOpacity(0.08)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primary.withOpacity(0.12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primary.withOpacity(0.12)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.teal, width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.rose),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: TextStyle(color: primary.withOpacity(0.35), fontFamily: _body),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.teal,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size(double.infinity, 52),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontFamily: _body, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.teal,
          side: const BorderSide(color: AppColors.teal),
          minimumSize: const Size(double.infinity, 52),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontFamily: _body, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.teal,
          textStyle: const TextStyle(fontFamily: _body, fontSize: 14),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: AppColors.teal.withOpacity(0.15),
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(fontFamily: _body, fontSize: 11, color: primary),
        ),
      ),
      dividerTheme: DividerThemeData(color: primary.withOpacity(0.08), thickness: 1),
      extensions: [isDark ? PresentColors.dark : PresentColors.light],
    );
  }

  static TextTheme _textTheme(Color primary, Color secondary) => TextTheme(
    displayLarge: _ts(57, FontWeight.w700, primary, -0.5, _display),
    displayMedium: _ts(45, FontWeight.w700, primary, -0.3, _display),
    displaySmall: _ts(36, FontWeight.w400, primary, 0, _display),
    headlineLarge: _ts(32, FontWeight.w700, primary, -0.2, _display),
    headlineMedium: _ts(28, FontWeight.w400, primary, 0, _display),
    headlineSmall: _ts(24, FontWeight.w400, primary, 0, _display),
    titleLarge: _ts(22, FontWeight.w600, primary, 0, _body),
    titleMedium: _ts(16, FontWeight.w600, primary, 0.1, _body),
    titleSmall: _ts(14, FontWeight.w500, primary, 0.1, _body),
    bodyLarge: _ts(16, FontWeight.w400, primary, 0, _body),
    bodyMedium: _ts(14, FontWeight.w400, primary, 0, _body),
    bodySmall: _ts(12, FontWeight.w400, secondary, 0, _body),
    labelLarge: _ts(14, FontWeight.w600, primary, 0.1, _body),
    labelMedium: _ts(12, FontWeight.w500, secondary, 0.5, _body),
    labelSmall: _ts(11, FontWeight.w500, secondary, 0.5, _body),
  );

  static TextStyle _ts(double size, FontWeight weight, Color color, double spacing, String family) =>
      TextStyle(fontFamily: family, fontSize: size, fontWeight: weight, color: color, letterSpacing: spacing, height: 1.35);
}

extension ThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
  PresentColors get pc => Theme.of(this).extension<PresentColors>() ?? PresentColors.light;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
