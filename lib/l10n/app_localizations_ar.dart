// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Present';

  @override
  String get continueButton => 'متابعة';

  @override
  String get cancelButton => 'إلغاء';

  @override
  String get skipButton => 'تخطي';

  @override
  String get doneButton => 'تم';

  @override
  String get backButton => 'رجوع';

  @override
  String get saveButton => 'حفظ';

  @override
  String get retryButton => 'حاول مجدداً';

  @override
  String get languageScreenTitle => 'اختر لغتك';

  @override
  String get languageScreenSubtitle => 'يمكنك تغييرها في أي وقت من الإعدادات';

  @override
  String get onboardingProblemTitle => 'الشاشة دائماً في الطريق';

  @override
  String get onboardingProblemBody =>
      'نقضي في المتوسط 4 ساعات و17 دقيقة يومياً على هواتفنا — غالباً بجانب من نحبهم.';

  @override
  String get onboardingSolutionTitle => 'Present يغيّر التركيز';

  @override
  String get onboardingSolutionBody =>
      'لا نحجب. نستبدل. بدلاً من التمرير، افعل ما يهم حقاً.';

  @override
  String get onboardingHowTitle => 'كيف يعمل';

  @override
  String get onboardingHowSteps =>
      '1. ابدأ جلسة حضور\n2. تنضم العائلة\n3. اكسبوا نقاط معاً';

  @override
  String get onboardingStartTitle => 'هل أنت مستعد للحضور؟';

  @override
  String get onboardingStartCta => 'إنشاء حساب';

  @override
  String get onboardingAlreadyHaveAccount => 'لدي حساب بالفعل';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count عائلة تستخدمه بالفعل';
  }

  @override
  String get authSignInWithApple => 'المتابعة مع Apple';

  @override
  String get authSignInWithGoogle => 'المتابعة مع Google';

  @override
  String get authEmailPlaceholder => 'بريدك@الإلكتروني.com';

  @override
  String get authSendMagicLink => 'إرسال رابط الدخول';

  @override
  String authMagicLinkSent(String email) {
    return 'تحقق من بريدك الإلكتروني — تم إرسال الرابط إلى $email';
  }

  @override
  String get authNoPassword => 'بدون كلمة مرور. أكثر أماناً.';

  @override
  String get authOr => 'أو';

  @override
  String get authBiometricPrompt => 'التحقق للمتابعة';

  @override
  String get authPasswordPlaceholder => 'Password';

  @override
  String get authUsePassword => 'Continue with email & password';

  @override
  String get authUseMagicLink => 'Use magic link instead';

  @override
  String get authSignIn => 'Sign in';

  @override
  String get authCreateAccount => 'Create account';

  @override
  String get authNoAccount => 'No account? Create one';

  @override
  String get authHaveAccount => 'Already have an account? Sign in';

  @override
  String get authInvalidPassword =>
      'Please enter a password (min. 6 characters)';

  @override
  String setupStep(int current, int total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get setupProfileTitle => 'ما اسمك؟';

  @override
  String get setupProfileNameHint => 'اسمك';

  @override
  String get setupFamilyTitle => 'أعطِ اسماً لعائلتك';

  @override
  String get setupFamilyHint => 'مثال: عائلة محمد';

  @override
  String get setupFamilyRole => 'دورك';

  @override
  String get setupRoleAdult => 'بالغ';

  @override
  String get setupRoleYoung => 'شاب';

  @override
  String get setupInviteTitle => 'ادعُ عائلتك';

  @override
  String get setupInviteSubtitle => 'اختياري — يمكنك فعل ذلك لاحقاً';

  @override
  String get setupInviteEmailHint => 'بريد أحد أفراد العائلة';

  @override
  String get setupInviteAddAnother => '+ إضافة شخص آخر';

  @override
  String get setupCreateFamily => 'إنشاء العائلة →';

  @override
  String get setupCanInviteLater => 'يمكنك دعوة المزيد لاحقاً';

  @override
  String homeGreeting(String name) {
    return 'مرحباً، $name 👋';
  }

  @override
  String get homeOfflineScoreLabel => 'نقاط الحضور الأسبوعية';

  @override
  String homeScoreUp(int pts) {
    return '↑ $pts نقطة أكثر من الأسبوع الماضي';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ $pts نقطة أقل من الأسبوع الماضي';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count حاضر';
  }

  @override
  String get homeMemberOffline => 'غير متصل';

  @override
  String get homeStartSession => '▶  ابدأ وقت الحضور';

  @override
  String get homeRitualSuggested => 'نشاط مقترح';

  @override
  String get homeDiaryThisWeek => 'يوميات هذا الأسبوع';

  @override
  String get sessionTitle => 'وقت الحضور';

  @override
  String get sessionMinutesTogether => 'دقيقة معاً';

  @override
  String get sessionStartNow => 'ابدأ الآن';

  @override
  String get sessionEndButton => 'إنهاء الجلسة';

  @override
  String sessionEndConfirm(int duration) {
    return 'إنهاء جلسة $duration دقيقة؟';
  }

  @override
  String get sessionKeepGoing => 'استمر';

  @override
  String get sessionCheckInPrompt => 'هل لا تزال حاضراً؟ ✋';

  @override
  String get sessionCheckInYes => 'نعم، أنا هنا';

  @override
  String get sessionCheckInNo => 'تشتت انتباهي';

  @override
  String get sessionCompletedTitle => 'أحسنت!';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts نقطة';
  }

  @override
  String sessionStreakMessage(int days) {
    return '$days أيام متتالية 🔥';
  }

  @override
  String get sessionDiaryPrompt => 'كيف كانت التجربة؟';

  @override
  String get sessionMinimumNotMet =>
      'الجلسات أقل من 5 دقائق لا تُحتسب في النقاط';

  @override
  String get dashboardTitle => 'الإحصائيات';

  @override
  String get dashboardOfflineScore => 'نقاط الحضور';

  @override
  String dashboardPercentile(int pct) {
    return 'ضمن أفضل $pct% من العائلات';
  }

  @override
  String get dashboardTimeTogether => 'الوقت معاً';

  @override
  String get dashboardSessions => 'جلسات';

  @override
  String get dashboardStreak => 'التسلسل';

  @override
  String get dashboardBestSession => 'أطول جلسة';

  @override
  String get dashboardPeriodWeek => 'أسبوع';

  @override
  String get dashboardPeriodMonth => 'شهر';

  @override
  String get dashboardPeriodAll => 'كل الوقت';

  @override
  String get dashboardPremiumRequired => 'فتح السجل الكامل';

  @override
  String get ritualsTitle => 'الأنشطة';

  @override
  String get ritualsSuggestedNow => 'مقترح الآن';

  @override
  String get ritualsOther => 'أنشطة أخرى';

  @override
  String get ritualsStartThis => 'ابدأ هذا النشاط ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min دقيقة';
  }

  @override
  String get familyTitle => 'العائلة';

  @override
  String familyMembers(int count) {
    return 'الأعضاء ($count)';
  }

  @override
  String get familyActiveNow => 'نشط الآن';

  @override
  String get familyInvitePending => 'الدعوة معلقة';

  @override
  String get familyInviteMember => '+ دعوة فرد من العائلة';

  @override
  String get familyInviteLink => 'نسخ رابط الدعوة';

  @override
  String get familyInviteLinkCopied => 'تم نسخ الرابط!';

  @override
  String get familyRoleAdmin => 'مسؤول';

  @override
  String get familyRoleAdult => 'بالغ';

  @override
  String get familyRoleYoung => 'شاب';

  @override
  String familyPointsLabel(int pts) {
    return '$pts نقطة';
  }

  @override
  String get diaryTitle => 'اليوميات';

  @override
  String get diaryHowWasIt => 'كيف كانت؟';

  @override
  String get diaryAddNote => 'إضافة ملاحظة (اختياري)';

  @override
  String get diaryNoteHint => 'بضع كلمات عن هذه اللحظة…';

  @override
  String diarySessionDuration(int min) {
    return '$min دقيقة معاً';
  }

  @override
  String get diaryNoEntries =>
      'لا توجد مدخلات في اليوميات بعد.\nابدأ أول جلسة حضور!';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsNotifications => 'الإشعارات';

  @override
  String get settingsNotificationsRituals => 'اقتراحات الأنشطة';

  @override
  String get settingsNotificationsStreak => 'تذكيرات التسلسل';

  @override
  String get settingsNotificationsFamily => 'نشاط العائلة';

  @override
  String get settingsPrivacy => 'الخصوصية';

  @override
  String get settingsBiometric => 'Face ID / بصمة الإصبع';

  @override
  String get settingsMfa => 'المصادقة الثنائية';

  @override
  String get settingsExportData => 'تصدير بياناتي';

  @override
  String get settingsDeleteAccount => 'حذف الحساب';

  @override
  String get settingsSubscription => 'الاشتراك';

  @override
  String get settingsSignOut => 'تسجيل الخروج';

  @override
  String settingsVersion(String version) {
    return 'الإصدار $version';
  }

  @override
  String get paywallTitle => 'كن حاضراً';

  @override
  String get paywallSubtitle => 'أقل من ثمن قهوة شهرياً للعائلة كلها.';

  @override
  String get paywallTrialBadge => 'تجربة مجانية 21 يوماً';

  @override
  String get paywallPlanFamily => 'العائلة';

  @override
  String get paywallPlanFamilyDesc => 'الجميع مشمولون. خطة واحدة.';

  @override
  String get paywallPlanIndividual => 'فردي';

  @override
  String get paywallPlanIndividualDesc => 'تجربة فردية متميزة.';

  @override
  String get paywallPerMonth => '/شهر';

  @override
  String get paywallStartTrial => 'ابدأ التجربة المجانية';

  @override
  String get paywallNoCard => 'لا حاجة لبطاقة ائتمان';

  @override
  String get paywallMaybeLater => 'ربما لاحقاً';

  @override
  String get paywallVsBuiltIn =>
      'على عكس Screen Time من Apple أو Digital Wellbeing من Google — نحن لا نقول فقط توقف. نحن نقول افعل هذا بدلاً من ذلك.';

  @override
  String get paywallRestorePurchases => 'استعادة المشتريات';

  @override
  String get errorGeneric => 'حدث خطأ ما. حاول مجدداً.';

  @override
  String get errorNetwork => 'لا يوجد اتصال بالإنترنت';

  @override
  String get errorAuthFailed => 'فشل التحقق';

  @override
  String get errorInvalidEmail => 'الرجاء إدخال بريد إلكتروني صحيح';

  @override
  String get errorSessionMinimum => 'الحد الأدنى لمدة الجلسة: 5 دقائق';

  @override
  String notifRitualTitle(String family) {
    return 'مساء الخير، $family 🌿';
  }

  @override
  String get notifRitualBody => 'وقت رائع لقضاء 30 دقيقة معاً.';

  @override
  String get notifStreakTitle => 'تسلسلك في خطر 🔥';

  @override
  String notifStreakBody(int days) {
    return 'لديك $days أيام متتالية. لا تكسرها الآن!';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return 'انضم $name إلى $family!';
  }

  @override
  String get notifTrialEndingTitle => 'تنتهي تجربتك المجانية قريباً ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return 'تبقى $days أيام. استمر بأقل من ثمن قهوة شهرياً.';
  }
}
