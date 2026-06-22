// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Present';

  @override
  String get continueButton => 'जारी रखें';

  @override
  String get cancelButton => 'रद्द करें';

  @override
  String get skipButton => 'छोड़ें';

  @override
  String get doneButton => 'हो गया';

  @override
  String get backButton => 'वापस';

  @override
  String get saveButton => 'सहेजें';

  @override
  String get retryButton => 'पुनः प्रयास करें';

  @override
  String get languageScreenTitle => 'अपनी भाषा चुनें';

  @override
  String get languageScreenSubtitle => 'आप इसे सेटिंग में कभी भी बदल सकते हैं';

  @override
  String get onboardingProblemTitle => 'स्क्रीन हमेशा बीच में आती है';

  @override
  String get onboardingProblemBody =>
      'हम औसतन रोज़ 4 घंटे 17 मिनट फोन पर बिताते हैं — अक्सर अपने प्रियजनों के पास बैठकर।';

  @override
  String get onboardingSolutionTitle => 'Present आपका ध्यान बदलता है';

  @override
  String get onboardingSolutionBody =>
      'हम ब्लॉक नहीं करते। हम बदलते हैं। स्क्रॉल करने की बजाय, वो करें जो वाकई ज़रूरी है।';

  @override
  String get onboardingHowTitle => 'यह कैसे काम करता है';

  @override
  String get onboardingHowSteps =>
      '1. Present सत्र शुरू करें\n2. परिवार जुड़ें\n3. साथ में अंक अर्जित करें';

  @override
  String get onboardingStartTitle => 'क्या आप तैयार हैं?';

  @override
  String get onboardingStartCta => 'खाता बनाएं';

  @override
  String get onboardingAlreadyHaveAccount => 'मेरे पास पहले से खाता है';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count परिवार पहले से जुड़े हैं';
  }

  @override
  String get authSignInWithApple => 'Apple से जारी रखें';

  @override
  String get authSignInWithGoogle => 'Google से जारी रखें';

  @override
  String get authEmailPlaceholder => 'आपका@ईमेल.com';

  @override
  String get authSendMagicLink => 'मैजिक लिंक भेजें';

  @override
  String authMagicLinkSent(String email) {
    return 'अपना ईमेल जांचें — $email पर लिंक भेजा गया';
  }

  @override
  String get authNoPassword => 'पासवर्ड नहीं। अधिक सुरक्षित।';

  @override
  String get authOr => 'या';

  @override
  String get authBiometricPrompt => 'जारी रखने के लिए प्रमाणित करें';

  @override
  String setupStep(int current, int total) {
    return 'चरण $current / $total';
  }

  @override
  String get setupProfileTitle => 'आपका नाम क्या है?';

  @override
  String get setupProfileNameHint => 'आपका नाम';

  @override
  String get setupFamilyTitle => 'अपने परिवार का नाम दें';

  @override
  String get setupFamilyHint => 'जैसे: शर्मा परिवार';

  @override
  String get setupFamilyRole => 'आपकी भूमिका';

  @override
  String get setupRoleAdult => 'वयस्क';

  @override
  String get setupRoleYoung => 'युवा';

  @override
  String get setupInviteTitle => 'परिवार को आमंत्रित करें';

  @override
  String get setupInviteSubtitle => 'वैकल्पिक — बाद में भी कर सकते हैं';

  @override
  String get setupInviteEmailHint => 'परिवार के सदस्य का ईमेल';

  @override
  String get setupInviteAddAnother => '+ और जोड़ें';

  @override
  String get setupCreateFamily => 'परिवार बनाएं →';

  @override
  String get setupCanInviteLater =>
      'आप बाद में और लोगों को आमंत्रित कर सकते हैं';

  @override
  String homeGreeting(String name) {
    return 'नमस्ते, $name 👋';
  }

  @override
  String get homeOfflineScoreLabel => 'साप्ताहिक ऑफलाइन स्कोर';

  @override
  String homeScoreUp(int pts) {
    return '↑ पिछले हफ्ते से $pts अंक अधिक';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ पिछले हफ्ते से $pts अंक कम';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count उपस्थित';
  }

  @override
  String get homeMemberOffline => 'ऑफलाइन';

  @override
  String get homeStartSession => '▶  साथ का समय शुरू करें';

  @override
  String get homeRitualSuggested => 'सुझाई गई गतिविधि';

  @override
  String get homeDiaryThisWeek => 'इस हफ्ते की डायरी';

  @override
  String get sessionTitle => 'साथ का समय';

  @override
  String get sessionMinutesTogether => 'मिनट साथ';

  @override
  String get sessionStartNow => 'अभी शुरू करें';

  @override
  String get sessionEndButton => 'समाप्त करें';

  @override
  String sessionEndConfirm(int duration) {
    return '$duration मिनट का सत्र समाप्त करें?';
  }

  @override
  String get sessionKeepGoing => 'जारी रखें';

  @override
  String get sessionCheckInPrompt => 'क्या आप अभी भी यहाँ हैं? ✋';

  @override
  String get sessionCheckInYes => 'हाँ, मैं यहाँ हूँ';

  @override
  String get sessionCheckInNo => 'मेरा ध्यान भटका';

  @override
  String get sessionCompletedTitle => 'बहुत बढ़िया!';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts अंक';
  }

  @override
  String sessionStreakMessage(int days) {
    return '$days दिन लगातार 🔥';
  }

  @override
  String get sessionDiaryPrompt => 'कैसा रहा?';

  @override
  String get sessionMinimumNotMet =>
      '5 मिनट से कम के सत्र स्कोर में नहीं गिने जाते';

  @override
  String get dashboardTitle => 'डैशबोर्ड';

  @override
  String get dashboardOfflineScore => 'ऑफलाइन स्कोर';

  @override
  String dashboardPercentile(int pct) {
    return 'शीर्ष $pct% परिवारों में';
  }

  @override
  String get dashboardTimeTogether => 'साथ बिताया समय';

  @override
  String get dashboardSessions => 'सत्र';

  @override
  String get dashboardStreak => 'लगातार दिन';

  @override
  String get dashboardBestSession => 'सबसे लंबा सत्र';

  @override
  String get dashboardPeriodWeek => 'सप्ताह';

  @override
  String get dashboardPeriodMonth => 'महीना';

  @override
  String get dashboardPeriodAll => 'पूरा इतिहास';

  @override
  String get dashboardPremiumRequired => 'पूरा इतिहास अनलॉक करें';

  @override
  String get ritualsTitle => 'गतिविधियाँ';

  @override
  String get ritualsSuggestedNow => 'अभी के लिए सुझाव';

  @override
  String get ritualsOther => 'अन्य गतिविधियाँ';

  @override
  String get ritualsStartThis => 'यह शुरू करें ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min मिनट';
  }

  @override
  String get familyTitle => 'परिवार';

  @override
  String familyMembers(int count) {
    return 'सदस्य ($count)';
  }

  @override
  String get familyActiveNow => 'अभी ऑनलाइन';

  @override
  String get familyInvitePending => 'आमंत्रण लंबित';

  @override
  String get familyInviteMember => '+ परिवार को आमंत्रित करें';

  @override
  String get familyInviteLink => 'आमंत्रण लिंक कॉपी करें';

  @override
  String get familyInviteLinkCopied => 'लिंक कॉपी हो गया!';

  @override
  String get familyRoleAdmin => 'एडमिन';

  @override
  String get familyRoleAdult => 'वयस्क';

  @override
  String get familyRoleYoung => 'युवा';

  @override
  String familyPointsLabel(int pts) {
    return '$pts अंक';
  }

  @override
  String get diaryTitle => 'डायरी';

  @override
  String get diaryHowWasIt => 'कैसा रहा?';

  @override
  String get diaryAddNote => 'नोट जोड़ें (वैकल्पिक)';

  @override
  String get diaryNoteHint => 'इस पल के बारे में कुछ लिखें…';

  @override
  String diarySessionDuration(int min) {
    return '$min मिनट साथ';
  }

  @override
  String get diaryNoEntries =>
      'अभी तक कोई डायरी प्रविष्टि नहीं है।\nअपना पहला सत्र शुरू करें!';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsNotifications => 'सूचनाएं';

  @override
  String get settingsNotificationsRituals => 'गतिविधि सुझाव';

  @override
  String get settingsNotificationsStreak => 'लगातार स्ट्रीक अनुस्मारक';

  @override
  String get settingsNotificationsFamily => 'पारिवारिक गतिविधि';

  @override
  String get settingsPrivacy => 'गोपनीयता';

  @override
  String get settingsBiometric => 'फेस आईडी / फिंगरप्रिंट';

  @override
  String get settingsMfa => 'दो-कारक प्रमाणीकरण';

  @override
  String get settingsExportData => 'मेरा डेटा निर्यात करें';

  @override
  String get settingsDeleteAccount => 'खाता हटाएं';

  @override
  String get settingsSubscription => 'सदस्यता';

  @override
  String get settingsSignOut => 'साइन आउट';

  @override
  String settingsVersion(String version) {
    return 'संस्करण $version';
  }

  @override
  String get paywallTitle => 'उपस्थित रहें';

  @override
  String get paywallSubtitle =>
      'महीने में एक कप चाय से भी कम में पूरे परिवार के लिए।';

  @override
  String get paywallTrialBadge => '21 दिन मुफ़्त';

  @override
  String get paywallPlanFamily => 'पारिवारिक';

  @override
  String get paywallPlanFamilyDesc => 'सभी शामिल। एक प्लान।';

  @override
  String get paywallPlanIndividual => 'व्यक्तिगत';

  @override
  String get paywallPlanIndividualDesc => 'व्यक्तिगत प्रीमियम अनुभव।';

  @override
  String get paywallPerMonth => '/माह';

  @override
  String get paywallStartTrial => 'मुफ़्त ट्रायल शुरू करें';

  @override
  String get paywallNoCard => 'क्रेडिट कार्ड की ज़रूरत नहीं';

  @override
  String get paywallMaybeLater => 'बाद में';

  @override
  String get paywallVsBuiltIn =>
      'Apple Screen Time या Google Digital Wellbeing के विपरीत — हम सिर्फ STOP नहीं कहते। हम कहते हैं इसकी जगह यह करें।';

  @override
  String get paywallRestorePurchases => 'खरीदारी पुनर्स्थापित करें';

  @override
  String get errorGeneric => 'कुछ गड़बड़ हो गई। कृपया पुनः प्रयास करें।';

  @override
  String get errorNetwork => 'इंटरनेट कनेक्शन नहीं है';

  @override
  String get errorAuthFailed => 'प्रमाणीकरण विफल';

  @override
  String get errorInvalidEmail => 'कृपया एक वैध ईमेल दर्ज करें';

  @override
  String get errorSessionMinimum => 'न्यूनतम सत्र समय: 5 मिनट';

  @override
  String notifRitualTitle(String family) {
    return 'शुभ संध्या, $family 🌿';
  }

  @override
  String get notifRitualBody => '30 मिनट साथ बिताने का यह अच्छा समय है।';

  @override
  String get notifStreakTitle => 'आपकी स्ट्रीक खतरे में है 🔥';

  @override
  String notifStreakBody(int days) {
    return 'आप $days दिनों से लगातार हैं। अब मत तोड़िए!';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return '$name $family में शामिल हो गए!';
  }

  @override
  String get notifTrialEndingTitle => 'मुफ़्त ट्रायल जल्द समाप्त होगा ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return '$days दिन बाकी हैं। एक चाय से कम में जारी रखें।';
  }
}
