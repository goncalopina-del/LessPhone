import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt', 'PT'),
    Locale('pt', 'BR'),
    Locale('zh'),
    Locale('hi'),
    Locale('es'),
    Locale('ar'),
    Locale('fr'),
    Locale('bn'),
    Locale('ru'),
    Locale('id'),
    Locale('pt')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get appName;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @skipButton.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipButton;

  /// No description provided for @doneButton.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneButton;

  /// No description provided for @backButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// No description provided for @saveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// No description provided for @retryButton.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retryButton;

  /// No description provided for @languageScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get languageScreenTitle;

  /// No description provided for @languageScreenSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You can change this anytime in Settings'**
  String get languageScreenSubtitle;

  /// No description provided for @onboardingProblemTitle.
  ///
  /// In en, this message translates to:
  /// **'The screen is always in the way'**
  String get onboardingProblemTitle;

  /// No description provided for @onboardingProblemBody.
  ///
  /// In en, this message translates to:
  /// **'On average, we spend 4 hours 17 minutes a day on our phones — often beside the people we love most.'**
  String get onboardingProblemBody;

  /// No description provided for @onboardingSolutionTitle.
  ///
  /// In en, this message translates to:
  /// **'Present changes the focus'**
  String get onboardingSolutionTitle;

  /// No description provided for @onboardingSolutionBody.
  ///
  /// In en, this message translates to:
  /// **'We don\'t block. We replace. Instead of scrolling, do something that actually matters.'**
  String get onboardingSolutionBody;

  /// No description provided for @onboardingHowTitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s how it works'**
  String get onboardingHowTitle;

  /// No description provided for @onboardingHowSteps.
  ///
  /// In en, this message translates to:
  /// **'1. Start a Present Session\n2. Family joins in\n3. Earn presence points together'**
  String get onboardingHowSteps;

  /// No description provided for @onboardingStartTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready to be present?'**
  String get onboardingStartTitle;

  /// No description provided for @onboardingStartCta.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get onboardingStartCta;

  /// No description provided for @onboardingAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'I already have an account'**
  String get onboardingAlreadyHaveAccount;

  /// No description provided for @onboardingFamiliesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} families already present'**
  String onboardingFamiliesCount(int count);

  /// No description provided for @authSignInWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get authSignInWithApple;

  /// No description provided for @authSignInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authSignInWithGoogle;

  /// No description provided for @authEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'your@email.com'**
  String get authEmailPlaceholder;

  /// No description provided for @authSendMagicLink.
  ///
  /// In en, this message translates to:
  /// **'Send magic link'**
  String get authSendMagicLink;

  /// No description provided for @authMagicLinkSent.
  ///
  /// In en, this message translates to:
  /// **'Check your email — link sent to {email}'**
  String authMagicLinkSent(String email);

  /// No description provided for @authNoPassword.
  ///
  /// In en, this message translates to:
  /// **'No password. More secure.'**
  String get authNoPassword;

  /// No description provided for @authOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get authOr;

  /// No description provided for @authBiometricPrompt.
  ///
  /// In en, this message translates to:
  /// **'Authenticate to continue'**
  String get authBiometricPrompt;

  /// No description provided for @authPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPasswordPlaceholder;

  /// No description provided for @authUsePassword.
  ///
  /// In en, this message translates to:
  /// **'Continue with email & password'**
  String get authUsePassword;

  /// No description provided for @authUseMagicLink.
  ///
  /// In en, this message translates to:
  /// **'Use magic link instead'**
  String get authUseMagicLink;

  /// No description provided for @authSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get authSignIn;

  /// No description provided for @authCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get authCreateAccount;

  /// No description provided for @authNoAccount.
  ///
  /// In en, this message translates to:
  /// **'No account? Create one'**
  String get authNoAccount;

  /// No description provided for @authHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get authHaveAccount;

  /// No description provided for @authInvalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password (min. 6 characters)'**
  String get authInvalidPassword;

  /// No description provided for @setupStep.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String setupStep(int current, int total);

  /// No description provided for @setupProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s your name?'**
  String get setupProfileTitle;

  /// No description provided for @setupProfileNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get setupProfileNameHint;

  /// No description provided for @setupFamilyTitle.
  ///
  /// In en, this message translates to:
  /// **'Name your family'**
  String get setupFamilyTitle;

  /// No description provided for @setupFamilyHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. The Silva Family'**
  String get setupFamilyHint;

  /// No description provided for @setupFamilyRole.
  ///
  /// In en, this message translates to:
  /// **'Your role'**
  String get setupFamilyRole;

  /// No description provided for @setupRoleAdult.
  ///
  /// In en, this message translates to:
  /// **'Adult'**
  String get setupRoleAdult;

  /// No description provided for @setupRoleYoung.
  ///
  /// In en, this message translates to:
  /// **'Young person'**
  String get setupRoleYoung;

  /// No description provided for @setupInviteTitle.
  ///
  /// In en, this message translates to:
  /// **'Invite your family'**
  String get setupInviteTitle;

  /// No description provided for @setupInviteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Optional — you can do this later'**
  String get setupInviteSubtitle;

  /// No description provided for @setupInviteEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Family member\'s email'**
  String get setupInviteEmailHint;

  /// No description provided for @setupInviteAddAnother.
  ///
  /// In en, this message translates to:
  /// **'+ Add another'**
  String get setupInviteAddAnother;

  /// No description provided for @setupCreateFamily.
  ///
  /// In en, this message translates to:
  /// **'Create family →'**
  String get setupCreateFamily;

  /// No description provided for @setupCanInviteLater.
  ///
  /// In en, this message translates to:
  /// **'You can invite more later'**
  String get setupCanInviteLater;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name} 👋'**
  String homeGreeting(String name);

  /// No description provided for @homeOfflineScoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Weekly Offline Score'**
  String get homeOfflineScoreLabel;

  /// No description provided for @homeScoreUp.
  ///
  /// In en, this message translates to:
  /// **'↑ {pts}pts vs last week'**
  String homeScoreUp(int pts);

  /// No description provided for @homeScoreDown.
  ///
  /// In en, this message translates to:
  /// **'↓ {pts}pts vs last week'**
  String homeScoreDown(int pts);

  /// No description provided for @homeMembersPresent.
  ///
  /// In en, this message translates to:
  /// **'{count} present'**
  String homeMembersPresent(int count);

  /// No description provided for @homeMemberOffline.
  ///
  /// In en, this message translates to:
  /// **'offline'**
  String get homeMemberOffline;

  /// No description provided for @homeStartSession.
  ///
  /// In en, this message translates to:
  /// **'▶  Start Present Session'**
  String get homeStartSession;

  /// No description provided for @homeRitualSuggested.
  ///
  /// In en, this message translates to:
  /// **'Suggested ritual'**
  String get homeRitualSuggested;

  /// No description provided for @homeDiaryThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week\'s diary'**
  String get homeDiaryThisWeek;

  /// No description provided for @sessionTitle.
  ///
  /// In en, this message translates to:
  /// **'Present Session'**
  String get sessionTitle;

  /// No description provided for @sessionMinutesTogether.
  ///
  /// In en, this message translates to:
  /// **'minutes together'**
  String get sessionMinutesTogether;

  /// No description provided for @sessionStartNow.
  ///
  /// In en, this message translates to:
  /// **'Start now'**
  String get sessionStartNow;

  /// No description provided for @sessionEndButton.
  ///
  /// In en, this message translates to:
  /// **'End session'**
  String get sessionEndButton;

  /// No description provided for @sessionEndConfirm.
  ///
  /// In en, this message translates to:
  /// **'End {duration} minute session?'**
  String sessionEndConfirm(int duration);

  /// No description provided for @sessionKeepGoing.
  ///
  /// In en, this message translates to:
  /// **'Keep going'**
  String get sessionKeepGoing;

  /// No description provided for @sessionCheckInPrompt.
  ///
  /// In en, this message translates to:
  /// **'Still present? ✋'**
  String get sessionCheckInPrompt;

  /// No description provided for @sessionCheckInYes.
  ///
  /// In en, this message translates to:
  /// **'Yes, still here'**
  String get sessionCheckInYes;

  /// No description provided for @sessionCheckInNo.
  ///
  /// In en, this message translates to:
  /// **'I got distracted'**
  String get sessionCheckInNo;

  /// No description provided for @sessionCompletedTitle.
  ///
  /// In en, this message translates to:
  /// **'Session complete!'**
  String get sessionCompletedTitle;

  /// No description provided for @sessionCompletedScore.
  ///
  /// In en, this message translates to:
  /// **'+{pts} points'**
  String sessionCompletedScore(int pts);

  /// No description provided for @sessionStreakMessage.
  ///
  /// In en, this message translates to:
  /// **'{days} day streak 🔥'**
  String sessionStreakMessage(int days);

  /// No description provided for @sessionDiaryPrompt.
  ///
  /// In en, this message translates to:
  /// **'How was it?'**
  String get sessionDiaryPrompt;

  /// No description provided for @sessionMinimumNotMet.
  ///
  /// In en, this message translates to:
  /// **'Sessions under 5 minutes don\'t count towards your score'**
  String get sessionMinimumNotMet;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @dashboardOfflineScore.
  ///
  /// In en, this message translates to:
  /// **'Offline Score'**
  String get dashboardOfflineScore;

  /// No description provided for @dashboardPercentile.
  ///
  /// In en, this message translates to:
  /// **'Top {pct}% of families'**
  String dashboardPercentile(int pct);

  /// No description provided for @dashboardTimeTogether.
  ///
  /// In en, this message translates to:
  /// **'Time together'**
  String get dashboardTimeTogether;

  /// No description provided for @dashboardSessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get dashboardSessions;

  /// No description provided for @dashboardStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get dashboardStreak;

  /// No description provided for @dashboardBestSession.
  ///
  /// In en, this message translates to:
  /// **'Best session'**
  String get dashboardBestSession;

  /// No description provided for @dashboardPeriodWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get dashboardPeriodWeek;

  /// No description provided for @dashboardPeriodMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get dashboardPeriodMonth;

  /// No description provided for @dashboardPeriodAll.
  ///
  /// In en, this message translates to:
  /// **'All time'**
  String get dashboardPeriodAll;

  /// No description provided for @dashboardPremiumRequired.
  ///
  /// In en, this message translates to:
  /// **'Unlock full history'**
  String get dashboardPremiumRequired;

  /// No description provided for @ritualsTitle.
  ///
  /// In en, this message translates to:
  /// **'Rituals'**
  String get ritualsTitle;

  /// No description provided for @ritualsSuggestedNow.
  ///
  /// In en, this message translates to:
  /// **'Suggested now'**
  String get ritualsSuggestedNow;

  /// No description provided for @ritualsOther.
  ///
  /// In en, this message translates to:
  /// **'Other rituals'**
  String get ritualsOther;

  /// No description provided for @ritualsStartThis.
  ///
  /// In en, this message translates to:
  /// **'Start this ritual ▶'**
  String get ritualsStartThis;

  /// No description provided for @ritualsMinutes.
  ///
  /// In en, this message translates to:
  /// **'{min} min'**
  String ritualsMinutes(int min);

  /// No description provided for @familyTitle.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get familyTitle;

  /// No description provided for @familyMembers.
  ///
  /// In en, this message translates to:
  /// **'Members ({count})'**
  String familyMembers(int count);

  /// No description provided for @familyActiveNow.
  ///
  /// In en, this message translates to:
  /// **'Active now'**
  String get familyActiveNow;

  /// No description provided for @familyInvitePending.
  ///
  /// In en, this message translates to:
  /// **'Invite pending'**
  String get familyInvitePending;

  /// No description provided for @familyInviteMember.
  ///
  /// In en, this message translates to:
  /// **'+ Invite family member'**
  String get familyInviteMember;

  /// No description provided for @familyInviteLink.
  ///
  /// In en, this message translates to:
  /// **'Copy invite link'**
  String get familyInviteLink;

  /// No description provided for @familyInviteLinkCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied!'**
  String get familyInviteLinkCopied;

  /// No description provided for @familyRoleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get familyRoleAdmin;

  /// No description provided for @familyRoleAdult.
  ///
  /// In en, this message translates to:
  /// **'Adult'**
  String get familyRoleAdult;

  /// No description provided for @familyRoleYoung.
  ///
  /// In en, this message translates to:
  /// **'Young'**
  String get familyRoleYoung;

  /// No description provided for @familyPointsLabel.
  ///
  /// In en, this message translates to:
  /// **'{pts}pts'**
  String familyPointsLabel(int pts);

  /// No description provided for @diaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Diary'**
  String get diaryTitle;

  /// No description provided for @diaryHowWasIt.
  ///
  /// In en, this message translates to:
  /// **'How was it?'**
  String get diaryHowWasIt;

  /// No description provided for @diaryAddNote.
  ///
  /// In en, this message translates to:
  /// **'Add a note (optional)'**
  String get diaryAddNote;

  /// No description provided for @diaryNoteHint.
  ///
  /// In en, this message translates to:
  /// **'A few words about this moment…'**
  String get diaryNoteHint;

  /// No description provided for @diarySessionDuration.
  ///
  /// In en, this message translates to:
  /// **'{min} min together'**
  String diarySessionDuration(int min);

  /// No description provided for @diaryNoEntries.
  ///
  /// In en, this message translates to:
  /// **'No diary entries yet.\nStart your first Present Session!'**
  String get diaryNoEntries;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsNotificationsRituals.
  ///
  /// In en, this message translates to:
  /// **'Ritual suggestions'**
  String get settingsNotificationsRituals;

  /// No description provided for @settingsNotificationsStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak reminders'**
  String get settingsNotificationsStreak;

  /// No description provided for @settingsNotificationsFamily.
  ///
  /// In en, this message translates to:
  /// **'Family activity'**
  String get settingsNotificationsFamily;

  /// No description provided for @settingsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get settingsPrivacy;

  /// No description provided for @settingsBiometric.
  ///
  /// In en, this message translates to:
  /// **'Face ID / Fingerprint'**
  String get settingsBiometric;

  /// No description provided for @settingsMfa.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication'**
  String get settingsMfa;

  /// No description provided for @settingsExportData.
  ///
  /// In en, this message translates to:
  /// **'Export my data'**
  String get settingsExportData;

  /// No description provided for @settingsDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get settingsDeleteAccount;

  /// No description provided for @settingsSubscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get settingsSubscription;

  /// No description provided for @settingsSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get settingsSignOut;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String settingsVersion(String version);

  /// No description provided for @paywallTitle.
  ///
  /// In en, this message translates to:
  /// **'Stay Present'**
  String get paywallTitle;

  /// No description provided for @paywallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Less than a coffee per month for your whole family.'**
  String get paywallSubtitle;

  /// No description provided for @paywallTrialBadge.
  ///
  /// In en, this message translates to:
  /// **'21-day free trial'**
  String get paywallTrialBadge;

  /// No description provided for @paywallPlanFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get paywallPlanFamily;

  /// No description provided for @paywallPlanFamilyDesc.
  ///
  /// In en, this message translates to:
  /// **'Everyone included. One plan.'**
  String get paywallPlanFamilyDesc;

  /// No description provided for @paywallPlanIndividual.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get paywallPlanIndividual;

  /// No description provided for @paywallPlanIndividualDesc.
  ///
  /// In en, this message translates to:
  /// **'Solo premium experience.'**
  String get paywallPlanIndividualDesc;

  /// No description provided for @paywallPerMonth.
  ///
  /// In en, this message translates to:
  /// **'/month'**
  String get paywallPerMonth;

  /// No description provided for @paywallStartTrial.
  ///
  /// In en, this message translates to:
  /// **'Start free trial'**
  String get paywallStartTrial;

  /// No description provided for @paywallNoCard.
  ///
  /// In en, this message translates to:
  /// **'No credit card required'**
  String get paywallNoCard;

  /// No description provided for @paywallMaybeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe later'**
  String get paywallMaybeLater;

  /// No description provided for @paywallVsBuiltIn.
  ///
  /// In en, this message translates to:
  /// **'Unlike Apple Screen Time or Google Digital Wellbeing — we don\'t just say STOP. We say DO THIS INSTEAD.'**
  String get paywallVsBuiltIn;

  /// No description provided for @paywallRestorePurchases.
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get paywallRestorePurchases;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get errorNetwork;

  /// No description provided for @errorAuthFailed.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed'**
  String get errorAuthFailed;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get errorInvalidEmail;

  /// No description provided for @errorSessionMinimum.
  ///
  /// In en, this message translates to:
  /// **'Minimum session time: 5 minutes'**
  String get errorSessionMinimum;

  /// No description provided for @notifRitualTitle.
  ///
  /// In en, this message translates to:
  /// **'Good evening, {family} 🌿'**
  String notifRitualTitle(String family);

  /// No description provided for @notifRitualBody.
  ///
  /// In en, this message translates to:
  /// **'A great time for 30 minutes together.'**
  String get notifRitualBody;

  /// No description provided for @notifStreakTitle.
  ///
  /// In en, this message translates to:
  /// **'Your streak is at risk 🔥'**
  String get notifStreakTitle;

  /// No description provided for @notifStreakBody.
  ///
  /// In en, this message translates to:
  /// **'You have {days} days in a row. Don\'t break it now!'**
  String notifStreakBody(int days);

  /// No description provided for @notifInviteAcceptedTitle.
  ///
  /// In en, this message translates to:
  /// **'{name} joined {family}!'**
  String notifInviteAcceptedTitle(String name, String family);

  /// No description provided for @notifTrialEndingTitle.
  ///
  /// In en, this message translates to:
  /// **'Your free trial ends soon ⏳'**
  String get notifTrialEndingTitle;

  /// No description provided for @notifTrialEndingBody.
  ///
  /// In en, this message translates to:
  /// **'{days} days left. Continue for less than a coffee a month.'**
  String notifTrialEndingBody(int days);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'bn',
        'en',
        'es',
        'fr',
        'hi',
        'id',
        'pt',
        'ru',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
