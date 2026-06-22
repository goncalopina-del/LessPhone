// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Present';

  @override
  String get continueButton => 'Continue';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get skipButton => 'Skip';

  @override
  String get doneButton => 'Done';

  @override
  String get backButton => 'Back';

  @override
  String get saveButton => 'Save';

  @override
  String get retryButton => 'Try again';

  @override
  String get languageScreenTitle => 'Choose your language';

  @override
  String get languageScreenSubtitle =>
      'You can change this anytime in Settings';

  @override
  String get onboardingProblemTitle => 'The screen is always in the way';

  @override
  String get onboardingProblemBody =>
      'On average, we spend 4 hours 17 minutes a day on our phones — often beside the people we love most.';

  @override
  String get onboardingSolutionTitle => 'Present changes the focus';

  @override
  String get onboardingSolutionBody =>
      'We don\'t block. We replace. Instead of scrolling, do something that actually matters.';

  @override
  String get onboardingHowTitle => 'Here\'s how it works';

  @override
  String get onboardingHowSteps =>
      '1. Start a Present Session\n2. Family joins in\n3. Earn presence points together';

  @override
  String get onboardingStartTitle => 'Ready to be present?';

  @override
  String get onboardingStartCta => 'Create account';

  @override
  String get onboardingAlreadyHaveAccount => 'I already have an account';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count families already present';
  }

  @override
  String get authSignInWithApple => 'Continue with Apple';

  @override
  String get authSignInWithGoogle => 'Continue with Google';

  @override
  String get authEmailPlaceholder => 'your@email.com';

  @override
  String get authSendMagicLink => 'Send magic link';

  @override
  String authMagicLinkSent(String email) {
    return 'Check your email — link sent to $email';
  }

  @override
  String get authNoPassword => 'No password. More secure.';

  @override
  String get authOr => 'or';

  @override
  String get authBiometricPrompt => 'Authenticate to continue';

  @override
  String setupStep(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get setupProfileTitle => 'What\'s your name?';

  @override
  String get setupProfileNameHint => 'Your name';

  @override
  String get setupFamilyTitle => 'Name your family';

  @override
  String get setupFamilyHint => 'e.g. The Silva Family';

  @override
  String get setupFamilyRole => 'Your role';

  @override
  String get setupRoleAdult => 'Adult';

  @override
  String get setupRoleYoung => 'Young person';

  @override
  String get setupInviteTitle => 'Invite your family';

  @override
  String get setupInviteSubtitle => 'Optional — you can do this later';

  @override
  String get setupInviteEmailHint => 'Family member\'s email';

  @override
  String get setupInviteAddAnother => '+ Add another';

  @override
  String get setupCreateFamily => 'Create family →';

  @override
  String get setupCanInviteLater => 'You can invite more later';

  @override
  String homeGreeting(String name) {
    return 'Hello, $name 👋';
  }

  @override
  String get homeOfflineScoreLabel => 'Weekly Offline Score';

  @override
  String homeScoreUp(int pts) {
    return '↑ ${pts}pts vs last week';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ ${pts}pts vs last week';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count present';
  }

  @override
  String get homeMemberOffline => 'offline';

  @override
  String get homeStartSession => '▶  Start Present Session';

  @override
  String get homeRitualSuggested => 'Suggested ritual';

  @override
  String get homeDiaryThisWeek => 'This week\'s diary';

  @override
  String get sessionTitle => 'Present Session';

  @override
  String get sessionMinutesTogether => 'minutes together';

  @override
  String get sessionStartNow => 'Start now';

  @override
  String get sessionEndButton => 'End session';

  @override
  String sessionEndConfirm(int duration) {
    return 'End $duration minute session?';
  }

  @override
  String get sessionKeepGoing => 'Keep going';

  @override
  String get sessionCheckInPrompt => 'Still present? ✋';

  @override
  String get sessionCheckInYes => 'Yes, still here';

  @override
  String get sessionCheckInNo => 'I got distracted';

  @override
  String get sessionCompletedTitle => 'Session complete!';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts points';
  }

  @override
  String sessionStreakMessage(int days) {
    return '$days day streak 🔥';
  }

  @override
  String get sessionDiaryPrompt => 'How was it?';

  @override
  String get sessionMinimumNotMet =>
      'Sessions under 5 minutes don\'t count towards your score';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardOfflineScore => 'Offline Score';

  @override
  String dashboardPercentile(int pct) {
    return 'Top $pct% of families';
  }

  @override
  String get dashboardTimeTogether => 'Time together';

  @override
  String get dashboardSessions => 'Sessions';

  @override
  String get dashboardStreak => 'Streak';

  @override
  String get dashboardBestSession => 'Best session';

  @override
  String get dashboardPeriodWeek => 'Week';

  @override
  String get dashboardPeriodMonth => 'Month';

  @override
  String get dashboardPeriodAll => 'All time';

  @override
  String get dashboardPremiumRequired => 'Unlock full history';

  @override
  String get ritualsTitle => 'Rituals';

  @override
  String get ritualsSuggestedNow => 'Suggested now';

  @override
  String get ritualsOther => 'Other rituals';

  @override
  String get ritualsStartThis => 'Start this ritual ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min min';
  }

  @override
  String get familyTitle => 'Family';

  @override
  String familyMembers(int count) {
    return 'Members ($count)';
  }

  @override
  String get familyActiveNow => 'Active now';

  @override
  String get familyInvitePending => 'Invite pending';

  @override
  String get familyInviteMember => '+ Invite family member';

  @override
  String get familyInviteLink => 'Copy invite link';

  @override
  String get familyInviteLinkCopied => 'Link copied!';

  @override
  String get familyRoleAdmin => 'Admin';

  @override
  String get familyRoleAdult => 'Adult';

  @override
  String get familyRoleYoung => 'Young';

  @override
  String familyPointsLabel(int pts) {
    return '${pts}pts';
  }

  @override
  String get diaryTitle => 'Diary';

  @override
  String get diaryHowWasIt => 'How was it?';

  @override
  String get diaryAddNote => 'Add a note (optional)';

  @override
  String get diaryNoteHint => 'A few words about this moment…';

  @override
  String diarySessionDuration(int min) {
    return '$min min together';
  }

  @override
  String get diaryNoEntries =>
      'No diary entries yet.\nStart your first Present Session!';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsNotificationsRituals => 'Ritual suggestions';

  @override
  String get settingsNotificationsStreak => 'Streak reminders';

  @override
  String get settingsNotificationsFamily => 'Family activity';

  @override
  String get settingsPrivacy => 'Privacy';

  @override
  String get settingsBiometric => 'Face ID / Fingerprint';

  @override
  String get settingsMfa => 'Two-factor authentication';

  @override
  String get settingsExportData => 'Export my data';

  @override
  String get settingsDeleteAccount => 'Delete account';

  @override
  String get settingsSubscription => 'Subscription';

  @override
  String get settingsSignOut => 'Sign out';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String get paywallTitle => 'Stay Present';

  @override
  String get paywallSubtitle =>
      'Less than a coffee per month for your whole family.';

  @override
  String get paywallTrialBadge => '21-day free trial';

  @override
  String get paywallPlanFamily => 'Family';

  @override
  String get paywallPlanFamilyDesc => 'Everyone included. One plan.';

  @override
  String get paywallPlanIndividual => 'Individual';

  @override
  String get paywallPlanIndividualDesc => 'Solo premium experience.';

  @override
  String get paywallPerMonth => '/month';

  @override
  String get paywallStartTrial => 'Start free trial';

  @override
  String get paywallNoCard => 'No credit card required';

  @override
  String get paywallMaybeLater => 'Maybe later';

  @override
  String get paywallVsBuiltIn =>
      'Unlike Apple Screen Time or Google Digital Wellbeing — we don\'t just say STOP. We say DO THIS INSTEAD.';

  @override
  String get paywallRestorePurchases => 'Restore purchases';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get errorNetwork => 'No internet connection';

  @override
  String get errorAuthFailed => 'Authentication failed';

  @override
  String get errorInvalidEmail => 'Please enter a valid email';

  @override
  String get errorSessionMinimum => 'Minimum session time: 5 minutes';

  @override
  String notifRitualTitle(String family) {
    return 'Good evening, $family 🌿';
  }

  @override
  String get notifRitualBody => 'A great time for 30 minutes together.';

  @override
  String get notifStreakTitle => 'Your streak is at risk 🔥';

  @override
  String notifStreakBody(int days) {
    return 'You have $days days in a row. Don\'t break it now!';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return '$name joined $family!';
  }

  @override
  String get notifTrialEndingTitle => 'Your free trial ends soon ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return '$days days left. Continue for less than a coffee a month.';
  }
}
