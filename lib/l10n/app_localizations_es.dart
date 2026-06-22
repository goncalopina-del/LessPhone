// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Present';

  @override
  String get continueButton => 'Continuar';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get skipButton => 'Omitir';

  @override
  String get doneButton => 'Listo';

  @override
  String get backButton => 'Volver';

  @override
  String get saveButton => 'Guardar';

  @override
  String get retryButton => 'Intentar de nuevo';

  @override
  String get languageScreenTitle => 'Elige tu idioma';

  @override
  String get languageScreenSubtitle =>
      'Puedes cambiarlo en cualquier momento en Ajustes';

  @override
  String get onboardingProblemTitle => 'La pantalla siempre está en medio';

  @override
  String get onboardingProblemBody =>
      'De media, pasamos 4 horas y 17 minutos al día en el móvil — a menudo junto a las personas que más queremos.';

  @override
  String get onboardingSolutionTitle => 'Present cambia el foco';

  @override
  String get onboardingSolutionBody =>
      'No bloqueamos. Sustituimos. En vez de hacer scroll, haz algo que realmente importa.';

  @override
  String get onboardingHowTitle => 'Cómo funciona';

  @override
  String get onboardingHowSteps =>
      '1. Inicia una Sesión Presente\n2. La familia se une\n3. Ganad puntos juntos';

  @override
  String get onboardingStartTitle => '¿Listo para estar presente?';

  @override
  String get onboardingStartCta => 'Crear cuenta';

  @override
  String get onboardingAlreadyHaveAccount => 'Ya tengo una cuenta';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count familias ya presentes';
  }

  @override
  String get authSignInWithApple => 'Continuar con Apple';

  @override
  String get authSignInWithGoogle => 'Continuar con Google';

  @override
  String get authEmailPlaceholder => 'tu@email.com';

  @override
  String get authSendMagicLink => 'Enviar magic link';

  @override
  String authMagicLinkSent(String email) {
    return 'Revisa tu correo — enlace enviado a $email';
  }

  @override
  String get authNoPassword => 'Sin contraseña. Más seguro.';

  @override
  String get authOr => 'o';

  @override
  String get authBiometricPrompt => 'Autentícate para continuar';

  @override
  String setupStep(int current, int total) {
    return 'Paso $current de $total';
  }

  @override
  String get setupProfileTitle => '¿Cuál es tu nombre?';

  @override
  String get setupProfileNameHint => 'Tu nombre';

  @override
  String get setupFamilyTitle => 'Dale un nombre a tu familia';

  @override
  String get setupFamilyHint => 'ej: Familia García';

  @override
  String get setupFamilyRole => 'Tu rol';

  @override
  String get setupRoleAdult => 'Adulto';

  @override
  String get setupRoleYoung => 'Joven';

  @override
  String get setupInviteTitle => 'Invita a tu familia';

  @override
  String get setupInviteSubtitle => 'Opcional — puedes hacerlo más tarde';

  @override
  String get setupInviteEmailHint => 'Email del familiar';

  @override
  String get setupInviteAddAnother => '+ Añadir otro';

  @override
  String get setupCreateFamily => 'Crear familia →';

  @override
  String get setupCanInviteLater => 'Puedes invitar más tarde';

  @override
  String homeGreeting(String name) {
    return 'Hola, $name 👋';
  }

  @override
  String get homeOfflineScoreLabel => 'Offline Score Semanal';

  @override
  String homeScoreUp(int pts) {
    return '↑ ${pts}pts vs semana pasada';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ ${pts}pts vs semana pasada';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count presente(s)';
  }

  @override
  String get homeMemberOffline => 'desconectado';

  @override
  String get homeStartSession => '▶  Iniciar Sesión Presente';

  @override
  String get homeRitualSuggested => 'Ritual sugerido';

  @override
  String get homeDiaryThisWeek => 'Diario de esta semana';

  @override
  String get sessionTitle => 'Sesión Presente';

  @override
  String get sessionMinutesTogether => 'minutos juntos';

  @override
  String get sessionStartNow => 'Empezar ahora';

  @override
  String get sessionEndButton => 'Terminar sesión';

  @override
  String sessionEndConfirm(int duration) {
    return '¿Terminar sesión de $duration minutos?';
  }

  @override
  String get sessionKeepGoing => 'Seguir';

  @override
  String get sessionCheckInPrompt => '¿Sigues presente? ✋';

  @override
  String get sessionCheckInYes => 'Sí, aquí sigo';

  @override
  String get sessionCheckInNo => 'Me distraje';

  @override
  String get sessionCompletedTitle => '¡Sesión completada!';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts puntos';
  }

  @override
  String sessionStreakMessage(int days) {
    return '$days días seguidos 🔥';
  }

  @override
  String get sessionDiaryPrompt => '¿Cómo fue?';

  @override
  String get sessionMinimumNotMet =>
      'Las sesiones de menos de 5 minutos no cuentan para el score';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardOfflineScore => 'Offline Score';

  @override
  String dashboardPercentile(int pct) {
    return 'Top $pct% de familias';
  }

  @override
  String get dashboardTimeTogether => 'Tiempo juntos';

  @override
  String get dashboardSessions => 'Sesiones';

  @override
  String get dashboardStreak => 'Racha';

  @override
  String get dashboardBestSession => 'Mejor sesión';

  @override
  String get dashboardPeriodWeek => 'Semana';

  @override
  String get dashboardPeriodMonth => 'Mes';

  @override
  String get dashboardPeriodAll => 'Historial';

  @override
  String get dashboardPremiumRequired => 'Desbloquear historial completo';

  @override
  String get ritualsTitle => 'Rituales';

  @override
  String get ritualsSuggestedNow => 'Sugerido ahora';

  @override
  String get ritualsOther => 'Otros rituales';

  @override
  String get ritualsStartThis => 'Iniciar este ritual ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min min';
  }

  @override
  String get familyTitle => 'Familia';

  @override
  String familyMembers(int count) {
    return 'Miembros ($count)';
  }

  @override
  String get familyActiveNow => 'Activo ahora';

  @override
  String get familyInvitePending => 'Invitación pendiente';

  @override
  String get familyInviteMember => '+ Invitar familiar';

  @override
  String get familyInviteLink => 'Copiar enlace de invitación';

  @override
  String get familyInviteLinkCopied => '¡Enlace copiado!';

  @override
  String get familyRoleAdmin => 'Admin';

  @override
  String get familyRoleAdult => 'Adulto';

  @override
  String get familyRoleYoung => 'Joven';

  @override
  String familyPointsLabel(int pts) {
    return '${pts}pts';
  }

  @override
  String get diaryTitle => 'Diario';

  @override
  String get diaryHowWasIt => '¿Cómo fue?';

  @override
  String get diaryAddNote => 'Añadir nota (opcional)';

  @override
  String get diaryNoteHint => 'Unas palabras sobre este momento…';

  @override
  String diarySessionDuration(int min) {
    return '$min min juntos';
  }

  @override
  String get diaryNoEntries =>
      'Aún no hay entradas en el diario.\n¡Inicia tu primera Sesión Presente!';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsNotifications => 'Notificaciones';

  @override
  String get settingsNotificationsRituals => 'Sugerencias de rituales';

  @override
  String get settingsNotificationsStreak => 'Recordatorios de racha';

  @override
  String get settingsNotificationsFamily => 'Actividad familiar';

  @override
  String get settingsPrivacy => 'Privacidad';

  @override
  String get settingsBiometric => 'Face ID / Huella dactilar';

  @override
  String get settingsMfa => 'Autenticación de dos factores';

  @override
  String get settingsExportData => 'Exportar mis datos';

  @override
  String get settingsDeleteAccount => 'Eliminar cuenta';

  @override
  String get settingsSubscription => 'Suscripción';

  @override
  String get settingsSignOut => 'Cerrar sesión';

  @override
  String settingsVersion(String version) {
    return 'Versión $version';
  }

  @override
  String get paywallTitle => 'Permanece Presente';

  @override
  String get paywallSubtitle => 'Menos de un café al mes para toda la familia.';

  @override
  String get paywallTrialBadge => '21 días gratis';

  @override
  String get paywallPlanFamily => 'Familia';

  @override
  String get paywallPlanFamilyDesc => 'Todos incluidos. Un plan.';

  @override
  String get paywallPlanIndividual => 'Individual';

  @override
  String get paywallPlanIndividualDesc => 'Experiencia solo premium.';

  @override
  String get paywallPerMonth => '/mes';

  @override
  String get paywallStartTrial => 'Empezar período gratuito';

  @override
  String get paywallNoCard => 'Sin tarjeta de crédito';

  @override
  String get paywallMaybeLater => 'Quizás más tarde';

  @override
  String get paywallVsBuiltIn =>
      'A diferencia del Screen Time de Apple o el Digital Wellbeing de Google — no decimos solo PARA. Decimos HAZ ESTO EN SU LUGAR.';

  @override
  String get paywallRestorePurchases => 'Restaurar compras';

  @override
  String get errorGeneric => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get errorNetwork => 'Sin conexión a internet';

  @override
  String get errorAuthFailed => 'Error de autenticación';

  @override
  String get errorInvalidEmail => 'Introduce un email válido';

  @override
  String get errorSessionMinimum => 'Tiempo mínimo de sesión: 5 minutos';

  @override
  String notifRitualTitle(String family) {
    return 'Buenas noches, $family 🌿';
  }

  @override
  String get notifRitualBody => 'Un buen momento para 30 minutos juntos.';

  @override
  String get notifStreakTitle => 'Vuestra racha está en riesgo 🔥';

  @override
  String notifStreakBody(int days) {
    return 'Lleváis $days días seguidos. ¡No lo dejéis romper ahora!';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return '¡$name se unió a $family!';
  }

  @override
  String get notifTrialEndingTitle => 'El período gratuito termina pronto ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return 'Quedan $days días. Seguid por menos de un café al mes.';
  }
}
