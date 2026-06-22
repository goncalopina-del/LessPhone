// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Present';

  @override
  String get continueButton => 'চালিয়ে যান';

  @override
  String get cancelButton => 'বাতিল';

  @override
  String get skipButton => 'এড়িয়ে যান';

  @override
  String get doneButton => 'সম্পন্ন';

  @override
  String get backButton => 'ফিরে যান';

  @override
  String get saveButton => 'সংরক্ষণ';

  @override
  String get retryButton => 'আবার চেষ্টা করুন';

  @override
  String get languageScreenTitle => 'আপনার ভাষা বেছে নিন';

  @override
  String get languageScreenSubtitle =>
      'আপনি যেকোনো সময় সেটিংসে এটি পরিবর্তন করতে পারবেন';

  @override
  String get onboardingProblemTitle => 'স্ক্রিন সবসময় মাঝে থাকে';

  @override
  String get onboardingProblemBody =>
      'আমরা গড়ে প্রতিদিন ৪ ঘণ্টা ১৭ মিনিট ফোনে কাটাই — প্রায়ই প্রিয়জনদের পাশে বসে।';

  @override
  String get onboardingSolutionTitle => 'Present মনোযোগ পরিবর্তন করে';

  @override
  String get onboardingSolutionBody =>
      'আমরা ব্লক করি না। আমরা প্রতিস্থাপন করি। স্ক্রল করার বদলে, সত্যিকারের গুরুত্বপূর্ণ কিছু করুন।';

  @override
  String get onboardingHowTitle => 'কীভাবে কাজ করে';

  @override
  String get onboardingHowSteps =>
      '1. একটি সেশন শুরু করুন\n2. পরিবার যোগ দেয়\n3. একসাথে পয়েন্ট অর্জন করুন';

  @override
  String get onboardingStartTitle => 'আপনি কি প্রস্তুত?';

  @override
  String get onboardingStartCta => 'অ্যাকাউন্ট তৈরি করুন';

  @override
  String get onboardingAlreadyHaveAccount => 'আমার ইতিমধ্যে অ্যাকাউন্ট আছে';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count টি পরিবার ইতিমধ্যে যোগ দিয়েছে';
  }

  @override
  String get authSignInWithApple => 'Apple দিয়ে চালিয়ে যান';

  @override
  String get authSignInWithGoogle => 'Google দিয়ে চালিয়ে যান';

  @override
  String get authEmailPlaceholder => 'আপনার@ইমেইল.com';

  @override
  String get authSendMagicLink => 'ম্যাজিক লিংক পাঠান';

  @override
  String authMagicLinkSent(String email) {
    return 'আপনার ইমেইল চেক করুন — $email তে লিংক পাঠানো হয়েছে';
  }

  @override
  String get authNoPassword => 'পাসওয়ার্ড ছাড়া। আরও নিরাপদ।';

  @override
  String get authOr => 'অথবা';

  @override
  String get authBiometricPrompt => 'চালিয়ে যেতে যাচাই করুন';

  @override
  String setupStep(int current, int total) {
    return 'ধাপ $current / $total';
  }

  @override
  String get setupProfileTitle => 'আপনার নাম কী?';

  @override
  String get setupProfileNameHint => 'আপনার নাম';

  @override
  String get setupFamilyTitle => 'আপনার পরিবারের নাম দিন';

  @override
  String get setupFamilyHint => 'যেমন: রহমান পরিবার';

  @override
  String get setupFamilyRole => 'আপনার ভূমিকা';

  @override
  String get setupRoleAdult => 'প্রাপ্তবয়স্ক';

  @override
  String get setupRoleYoung => 'তরুণ';

  @override
  String get setupInviteTitle => 'পরিবারকে আমন্ত্রণ জানান';

  @override
  String get setupInviteSubtitle => 'ঐচ্ছিক — পরে করতে পারবেন';

  @override
  String get setupInviteEmailHint => 'পরিবারের সদস্যের ইমেইল';

  @override
  String get setupInviteAddAnother => '+ আরেকজন যোগ করুন';

  @override
  String get setupCreateFamily => 'পরিবার তৈরি করুন →';

  @override
  String get setupCanInviteLater => 'পরেও আমন্ত্রণ জানাতে পারবেন';

  @override
  String homeGreeting(String name) {
    return 'হ্যালো, $name 👋';
  }

  @override
  String get homeOfflineScoreLabel => 'সাপ্তাহিক অফলাইন স্কোর';

  @override
  String homeScoreUp(int pts) {
    return '↑ গত সপ্তাহের চেয়ে $pts পয়েন্ট বেশি';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ গত সপ্তাহের চেয়ে $pts পয়েন্ট কম';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count জন উপস্থিত';
  }

  @override
  String get homeMemberOffline => 'অফলাইন';

  @override
  String get homeStartSession => '▶  একসাথে সময় শুরু করুন';

  @override
  String get homeRitualSuggested => 'প্রস্তাবিত কার্যক্রম';

  @override
  String get homeDiaryThisWeek => 'এই সপ্তাহের ডায়েরি';

  @override
  String get sessionTitle => 'একসাথে সময়';

  @override
  String get sessionMinutesTogether => 'মিনিট একসাথে';

  @override
  String get sessionStartNow => 'এখনই শুরু করুন';

  @override
  String get sessionEndButton => 'শেষ করুন';

  @override
  String sessionEndConfirm(int duration) {
    return '$duration মিনিটের সেশন শেষ করবেন?';
  }

  @override
  String get sessionKeepGoing => 'চালিয়ে যান';

  @override
  String get sessionCheckInPrompt => 'আপনি কি এখনও এখানে আছেন? ✋';

  @override
  String get sessionCheckInYes => 'হ্যাঁ, আমি এখানে আছি';

  @override
  String get sessionCheckInNo => 'আমার মনোযোগ সরে গেছে';

  @override
  String get sessionCompletedTitle => 'সেশন সম্পন্ন!';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts পয়েন্ট';
  }

  @override
  String sessionStreakMessage(int days) {
    return 'টানা $days দিন 🔥';
  }

  @override
  String get sessionDiaryPrompt => 'কেমন ছিল?';

  @override
  String get sessionMinimumNotMet => '৫ মিনিটের কম সেশন স্কোরে গণনা হয় না';

  @override
  String get dashboardTitle => 'ড্যাশবোর্ড';

  @override
  String get dashboardOfflineScore => 'অফলাইন স্কোর';

  @override
  String dashboardPercentile(int pct) {
    return 'শীর্ষ $pct% পরিবারের মধ্যে';
  }

  @override
  String get dashboardTimeTogether => 'একসাথে সময়';

  @override
  String get dashboardSessions => 'সেশন';

  @override
  String get dashboardStreak => 'ধারাবাহিকতা';

  @override
  String get dashboardBestSession => 'সেরা সেশন';

  @override
  String get dashboardPeriodWeek => 'সপ্তাহ';

  @override
  String get dashboardPeriodMonth => 'মাস';

  @override
  String get dashboardPeriodAll => 'সম্পূর্ণ ইতিহাস';

  @override
  String get dashboardPremiumRequired => 'সম্পূর্ণ ইতিহাস আনলক করুন';

  @override
  String get ritualsTitle => 'কার্যক্রম';

  @override
  String get ritualsSuggestedNow => 'এখন প্রস্তাবিত';

  @override
  String get ritualsOther => 'অন্যান্য কার্যক্রম';

  @override
  String get ritualsStartThis => 'এটি শুরু করুন ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min মিনিট';
  }

  @override
  String get familyTitle => 'পরিবার';

  @override
  String familyMembers(int count) {
    return 'সদস্য ($count)';
  }

  @override
  String get familyActiveNow => 'এখন সক্রিয়';

  @override
  String get familyInvitePending => 'আমন্ত্রণ মুলতুবি';

  @override
  String get familyInviteMember => '+ পরিবারের সদস্যকে আমন্ত্রণ জানান';

  @override
  String get familyInviteLink => 'আমন্ত্রণ লিংক কপি করুন';

  @override
  String get familyInviteLinkCopied => 'লিংক কপি হয়েছে!';

  @override
  String get familyRoleAdmin => 'অ্যাডমিন';

  @override
  String get familyRoleAdult => 'প্রাপ্তবয়স্ক';

  @override
  String get familyRoleYoung => 'তরুণ';

  @override
  String familyPointsLabel(int pts) {
    return '$pts পয়েন্ট';
  }

  @override
  String get diaryTitle => 'ডায়েরি';

  @override
  String get diaryHowWasIt => 'কেমন ছিল?';

  @override
  String get diaryAddNote => 'নোট যোগ করুন (ঐচ্ছিক)';

  @override
  String get diaryNoteHint => 'এই মুহূর্ত সম্পর্কে কিছু লিখুন…';

  @override
  String diarySessionDuration(int min) {
    return '$min মিনিট একসাথে';
  }

  @override
  String get diaryNoEntries =>
      'এখনও কোনো ডায়েরি এন্ট্রি নেই।\nআপনার প্রথম সেশন শুরু করুন!';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get settingsLanguage => 'ভাষা';

  @override
  String get settingsNotifications => 'বিজ্ঞপ্তি';

  @override
  String get settingsNotificationsRituals => 'কার্যক্রম পরামর্শ';

  @override
  String get settingsNotificationsStreak => 'ধারাবাহিকতার রিমাইন্ডার';

  @override
  String get settingsNotificationsFamily => 'পারিবারিক কার্যক্রম';

  @override
  String get settingsPrivacy => 'গোপনীয়তা';

  @override
  String get settingsBiometric => 'ফেস আইডি / আঙুলের ছাপ';

  @override
  String get settingsMfa => 'দ্বি-ফ্যাক্টর যাচাইকরণ';

  @override
  String get settingsExportData => 'আমার ডেটা রপ্তানি করুন';

  @override
  String get settingsDeleteAccount => 'অ্যাকাউন্ট মুছে ফেলুন';

  @override
  String get settingsSubscription => 'সাবস্ক্রিপশন';

  @override
  String get settingsSignOut => 'সাইন আউট';

  @override
  String settingsVersion(String version) {
    return 'সংস্করণ $version';
  }

  @override
  String get paywallTitle => 'উপস্থিত থাকুন';

  @override
  String get paywallSubtitle =>
      'প্রতি মাসে এক কাপ চায়ের চেয়েও কম খরচে পুরো পরিবারের জন্য।';

  @override
  String get paywallTrialBadge => '২১ দিন বিনামূল্যে';

  @override
  String get paywallPlanFamily => 'পারিবারিক';

  @override
  String get paywallPlanFamilyDesc => 'সবাই অন্তর্ভুক্ত। একটি প্ল্যান।';

  @override
  String get paywallPlanIndividual => 'ব্যক্তিগত';

  @override
  String get paywallPlanIndividualDesc => 'ব্যক্তিগত প্রিমিয়াম অভিজ্ঞতা।';

  @override
  String get paywallPerMonth => '/মাস';

  @override
  String get paywallStartTrial => 'বিনামূল্যে ট্রায়াল শুরু করুন';

  @override
  String get paywallNoCard => 'ক্রেডিট কার্ড লাগবে না';

  @override
  String get paywallMaybeLater => 'পরে হয়তো';

  @override
  String get paywallVsBuiltIn =>
      'Apple Screen Time বা Google Digital Wellbeing-এর মতো নয় — আমরা শুধু থামতে বলি না। আমরা বলি এর বদলে এটি করুন।';

  @override
  String get paywallRestorePurchases => 'কেনাকাটা পুনরুদ্ধার করুন';

  @override
  String get errorGeneric => 'কিছু একটা ভুল হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get errorNetwork => 'ইন্টারনেট সংযোগ নেই';

  @override
  String get errorAuthFailed => 'যাচাইকরণ ব্যর্থ হয়েছে';

  @override
  String get errorInvalidEmail => 'একটি বৈধ ইমেইল প্রবেশ করুন';

  @override
  String get errorSessionMinimum => 'সর্বনিম্ন সেশন সময়: ৫ মিনিট';

  @override
  String notifRitualTitle(String family) {
    return 'শুভ সন্ধ্যা, $family 🌿';
  }

  @override
  String get notifRitualBody => 'একসাথে ৩০ মিনিট কাটানোর এটি একটি ভালো সময়।';

  @override
  String get notifStreakTitle => 'আপনার ধারাবাহিকতা ঝুঁকিতে 🔥';

  @override
  String notifStreakBody(int days) {
    return 'আপনার টানা $days দিন হয়েছে। এখন ভাঙবেন না!';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return '$name $family-এ যোগ দিয়েছে!';
  }

  @override
  String get notifTrialEndingTitle => 'বিনামূল্যে ট্রায়াল শীঘ্রই শেষ হচ্ছে ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return '$days দিন বাকি আছে। এক কাপ চায়ের চেয়ে কম খরচে চালিয়ে যান।';
  }
}
