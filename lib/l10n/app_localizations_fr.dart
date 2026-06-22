// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Present';

  @override
  String get continueButton => 'Continuer';

  @override
  String get cancelButton => 'Annuler';

  @override
  String get skipButton => 'Passer';

  @override
  String get doneButton => 'Terminé';

  @override
  String get backButton => 'Retour';

  @override
  String get saveButton => 'Sauvegarder';

  @override
  String get retryButton => 'Réessayer';

  @override
  String get languageScreenTitle => 'Choisissez votre langue';

  @override
  String get languageScreenSubtitle =>
      'Vous pouvez la modifier à tout moment dans les Paramètres';

  @override
  String get onboardingProblemTitle => 'L\'écran est toujours entre vous';

  @override
  String get onboardingProblemBody =>
      'En moyenne, nous passons 4h17 par jour sur notre téléphone — souvent à côté des personnes que nous aimons le plus.';

  @override
  String get onboardingSolutionTitle => 'Present change le focus';

  @override
  String get onboardingSolutionBody =>
      'Nous ne bloquons pas. Nous remplaçons. Au lieu de scroller, faites quelque chose qui compte vraiment.';

  @override
  String get onboardingHowTitle => 'Comment ça marche';

  @override
  String get onboardingHowSteps =>
      '1. Démarrez une Session Présence\n2. La famille rejoint\n3. Gagnez des points ensemble';

  @override
  String get onboardingStartTitle => 'Prêt à être présent ?';

  @override
  String get onboardingStartCta => 'Créer un compte';

  @override
  String get onboardingAlreadyHaveAccount => 'J\'ai déjà un compte';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count familles déjà présentes';
  }

  @override
  String get authSignInWithApple => 'Continuer avec Apple';

  @override
  String get authSignInWithGoogle => 'Continuer avec Google';

  @override
  String get authEmailPlaceholder => 'votre@email.com';

  @override
  String get authSendMagicLink => 'Envoyer le lien magique';

  @override
  String authMagicLinkSent(String email) {
    return 'Vérifiez votre e-mail — lien envoyé à $email';
  }

  @override
  String get authNoPassword => 'Sans mot de passe. Plus sécurisé.';

  @override
  String get authOr => 'ou';

  @override
  String get authBiometricPrompt => 'Authentifiez-vous pour continuer';

  @override
  String setupStep(int current, int total) {
    return 'Étape $current sur $total';
  }

  @override
  String get setupProfileTitle => 'Quel est votre prénom ?';

  @override
  String get setupProfileNameHint => 'Votre prénom';

  @override
  String get setupFamilyTitle => 'Donnez un nom à votre famille';

  @override
  String get setupFamilyHint => 'ex : Famille Martin';

  @override
  String get setupFamilyRole => 'Votre rôle';

  @override
  String get setupRoleAdult => 'Adulte';

  @override
  String get setupRoleYoung => 'Jeune';

  @override
  String get setupInviteTitle => 'Invitez votre famille';

  @override
  String get setupInviteSubtitle =>
      'Facultatif — vous pouvez le faire plus tard';

  @override
  String get setupInviteEmailHint => 'E-mail du membre de la famille';

  @override
  String get setupInviteAddAnother => '+ Ajouter une autre personne';

  @override
  String get setupCreateFamily => 'Créer la famille →';

  @override
  String get setupCanInviteLater => 'Vous pouvez inviter plus tard';

  @override
  String homeGreeting(String name) {
    return 'Bonjour, $name 👋';
  }

  @override
  String get homeOfflineScoreLabel => 'Score hebdomadaire';

  @override
  String homeScoreUp(int pts) {
    return '↑ ${pts}pts vs la semaine dernière';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ ${pts}pts vs la semaine dernière';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count présent(s)';
  }

  @override
  String get homeMemberOffline => 'hors ligne';

  @override
  String get homeStartSession => '▶  Démarrer une session présence';

  @override
  String get homeRitualSuggested => 'Activité suggérée';

  @override
  String get homeDiaryThisWeek => 'Journal de la semaine';

  @override
  String get sessionTitle => 'Session Présence';

  @override
  String get sessionMinutesTogether => 'minutes ensemble';

  @override
  String get sessionStartNow => 'Démarrer maintenant';

  @override
  String get sessionEndButton => 'Terminer la session';

  @override
  String sessionEndConfirm(int duration) {
    return 'Terminer la session de $duration minutes ?';
  }

  @override
  String get sessionKeepGoing => 'Continuer';

  @override
  String get sessionCheckInPrompt => 'Êtes-vous toujours là ? ✋';

  @override
  String get sessionCheckInYes => 'Oui, je suis là';

  @override
  String get sessionCheckInNo => 'Je me suis laissé distraire';

  @override
  String get sessionCompletedTitle => 'Session terminée !';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts points';
  }

  @override
  String sessionStreakMessage(int days) {
    return '$days jours consécutifs 🔥';
  }

  @override
  String get sessionDiaryPrompt => 'Comment s\'est passée la session ?';

  @override
  String get sessionMinimumNotMet =>
      'Les sessions de moins de 5 minutes ne comptent pas';

  @override
  String get dashboardTitle => 'Tableau de bord';

  @override
  String get dashboardOfflineScore => 'Score hors ligne';

  @override
  String dashboardPercentile(int pct) {
    return 'Top $pct% des familles';
  }

  @override
  String get dashboardTimeTogether => 'Temps ensemble';

  @override
  String get dashboardSessions => 'Sessions';

  @override
  String get dashboardStreak => 'Série';

  @override
  String get dashboardBestSession => 'Meilleure session';

  @override
  String get dashboardPeriodWeek => 'Semaine';

  @override
  String get dashboardPeriodMonth => 'Mois';

  @override
  String get dashboardPeriodAll => 'Historique';

  @override
  String get dashboardPremiumRequired => 'Débloquer l\'historique complet';

  @override
  String get ritualsTitle => 'Rituels';

  @override
  String get ritualsSuggestedNow => 'Suggéré maintenant';

  @override
  String get ritualsOther => 'Autres rituels';

  @override
  String get ritualsStartThis => 'Démarrer ce rituel ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min min';
  }

  @override
  String get familyTitle => 'Famille';

  @override
  String familyMembers(int count) {
    return 'Membres ($count)';
  }

  @override
  String get familyActiveNow => 'Actif maintenant';

  @override
  String get familyInvitePending => 'Invitation en attente';

  @override
  String get familyInviteMember => '+ Inviter un membre';

  @override
  String get familyInviteLink => 'Copier le lien d\'invitation';

  @override
  String get familyInviteLinkCopied => 'Lien copié !';

  @override
  String get familyRoleAdmin => 'Admin';

  @override
  String get familyRoleAdult => 'Adulte';

  @override
  String get familyRoleYoung => 'Jeune';

  @override
  String familyPointsLabel(int pts) {
    return '${pts}pts';
  }

  @override
  String get diaryTitle => 'Journal';

  @override
  String get diaryHowWasIt => 'Comment s\'est passée la session ?';

  @override
  String get diaryAddNote => 'Ajouter une note (facultatif)';

  @override
  String get diaryNoteHint => 'Quelques mots sur ce moment…';

  @override
  String diarySessionDuration(int min) {
    return '$min min ensemble';
  }

  @override
  String get diaryNoEntries =>
      'Pas encore d\'entrées dans le journal.\nCommencez votre première session !';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsNotificationsRituals => 'Suggestions de rituels';

  @override
  String get settingsNotificationsStreak => 'Rappels de série';

  @override
  String get settingsNotificationsFamily => 'Activité familiale';

  @override
  String get settingsPrivacy => 'Confidentialité';

  @override
  String get settingsBiometric => 'Face ID / Empreinte digitale';

  @override
  String get settingsMfa => 'Authentification à deux facteurs';

  @override
  String get settingsExportData => 'Exporter mes données';

  @override
  String get settingsDeleteAccount => 'Supprimer le compte';

  @override
  String get settingsSubscription => 'Abonnement';

  @override
  String get settingsSignOut => 'Se déconnecter';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String get paywallTitle => 'Restez Présent';

  @override
  String get paywallSubtitle =>
      'Moins d\'un café par mois pour toute la famille.';

  @override
  String get paywallTrialBadge => '21 jours d\'essai gratuit';

  @override
  String get paywallPlanFamily => 'Famille';

  @override
  String get paywallPlanFamilyDesc =>
      'Tout le monde inclus. Un seul abonnement.';

  @override
  String get paywallPlanIndividual => 'Individuel';

  @override
  String get paywallPlanIndividualDesc => 'Expérience solo premium.';

  @override
  String get paywallPerMonth => '/mois';

  @override
  String get paywallStartTrial => 'Commencer l\'essai gratuit';

  @override
  String get paywallNoCard => 'Sans carte bancaire';

  @override
  String get paywallMaybeLater => 'Peut-être plus tard';

  @override
  String get paywallVsBuiltIn =>
      'Contrairement au Screen Time d\'Apple ou au Digital Wellbeing de Google — nous ne disons pas seulement ARRÊTE. Nous disons FAIS CECI À LA PLACE.';

  @override
  String get paywallRestorePurchases => 'Restaurer les achats';

  @override
  String get errorGeneric => 'Une erreur s\'est produite. Réessayez.';

  @override
  String get errorNetwork => 'Pas de connexion internet';

  @override
  String get errorAuthFailed => 'Échec de l\'authentification';

  @override
  String get errorInvalidEmail => 'Veuillez saisir un e-mail valide';

  @override
  String get errorSessionMinimum => 'Durée minimale de session : 5 minutes';

  @override
  String notifRitualTitle(String family) {
    return 'Bonsoir, $family 🌿';
  }

  @override
  String get notifRitualBody =>
      'C\'est le bon moment pour 30 minutes ensemble.';

  @override
  String get notifStreakTitle => 'Votre série est en danger 🔥';

  @override
  String notifStreakBody(int days) {
    return 'Vous avez $days jours consécutifs. Ne brisez pas ça maintenant !';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return '$name a rejoint $family !';
  }

  @override
  String get notifTrialEndingTitle =>
      'Votre essai gratuit se termine bientôt ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return 'Il reste $days jours. Continuez pour moins d\'un café par mois.';
  }
}
