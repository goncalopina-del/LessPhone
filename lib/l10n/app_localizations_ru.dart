// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Present';

  @override
  String get continueButton => 'Продолжить';

  @override
  String get cancelButton => 'Отмена';

  @override
  String get skipButton => 'Пропустить';

  @override
  String get doneButton => 'Готово';

  @override
  String get backButton => 'Назад';

  @override
  String get saveButton => 'Сохранить';

  @override
  String get retryButton => 'Повторить';

  @override
  String get languageScreenTitle => 'Выберите язык';

  @override
  String get languageScreenSubtitle =>
      'Вы можете изменить его в настройках в любое время';

  @override
  String get onboardingProblemTitle => 'Экран всегда между вами';

  @override
  String get onboardingProblemBody =>
      'В среднем мы проводим 4 часа 17 минут в день за телефоном — зачастую рядом с самыми близкими людьми.';

  @override
  String get onboardingSolutionTitle => 'Present меняет фокус';

  @override
  String get onboardingSolutionBody =>
      'Мы не блокируем. Мы заменяем. Вместо бесконечного скролла — то, что действительно важно.';

  @override
  String get onboardingHowTitle => 'Как это работает';

  @override
  String get onboardingHowSteps =>
      '1. Начните сессию присутствия\n2. Семья присоединяется\n3. Зарабатывайте очки вместе';

  @override
  String get onboardingStartTitle => 'Готовы быть здесь?';

  @override
  String get onboardingStartCta => 'Создать аккаунт';

  @override
  String get onboardingAlreadyHaveAccount => 'У меня уже есть аккаунт';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count семей уже используют';
  }

  @override
  String get authSignInWithApple => 'Продолжить с Apple';

  @override
  String get authSignInWithGoogle => 'Продолжить с Google';

  @override
  String get authEmailPlaceholder => 'ваш@email.ru';

  @override
  String get authSendMagicLink => 'Отправить волшебную ссылку';

  @override
  String authMagicLinkSent(String email) {
    return 'Проверьте почту — ссылка отправлена на $email';
  }

  @override
  String get authNoPassword => 'Без пароля. Безопаснее.';

  @override
  String get authOr => 'или';

  @override
  String get authBiometricPrompt => 'Подтвердите личность для продолжения';

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
    return 'Шаг $current из $total';
  }

  @override
  String get setupProfileTitle => 'Как вас зовут?';

  @override
  String get setupProfileNameHint => 'Ваше имя';

  @override
  String get setupFamilyTitle => 'Дайте имя вашей семье';

  @override
  String get setupFamilyHint => 'например: Семья Ивановых';

  @override
  String get setupFamilyRole => 'Ваша роль';

  @override
  String get setupRoleAdult => 'Взрослый';

  @override
  String get setupRoleYoung => 'Молодой';

  @override
  String get setupInviteTitle => 'Пригласите семью';

  @override
  String get setupInviteSubtitle => 'Необязательно — можно сделать позже';

  @override
  String get setupInviteEmailHint => 'Email члена семьи';

  @override
  String get setupInviteAddAnother => '+ Добавить ещё';

  @override
  String get setupCreateFamily => 'Создать семью →';

  @override
  String get setupCanInviteLater => 'Вы можете пригласить позже';

  @override
  String homeGreeting(String name) {
    return 'Привет, $name 👋';
  }

  @override
  String get homeOfflineScoreLabel => 'Еженедельный офлайн-счёт';

  @override
  String homeScoreUp(int pts) {
    return '↑ На $pts очков больше, чем на прошлой неделе';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ На $pts очков меньше, чем на прошлой неделе';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count присутствует';
  }

  @override
  String get homeMemberOffline => 'не в сети';

  @override
  String get homeStartSession => '▶  Начать сессию присутствия';

  @override
  String get homeRitualSuggested => 'Предлагаемое занятие';

  @override
  String get homeDiaryThisWeek => 'Дневник за неделю';

  @override
  String get sessionTitle => 'Сессия присутствия';

  @override
  String get sessionMinutesTogether => 'минут вместе';

  @override
  String get sessionStartNow => 'Начать сейчас';

  @override
  String get sessionEndButton => 'Завершить сессию';

  @override
  String sessionEndConfirm(int duration) {
    return 'Завершить сессию на $duration минут?';
  }

  @override
  String get sessionKeepGoing => 'Продолжить';

  @override
  String get sessionCheckInPrompt => 'Вы ещё здесь? ✋';

  @override
  String get sessionCheckInYes => 'Да, я здесь';

  @override
  String get sessionCheckInNo => 'Я отвлёкся';

  @override
  String get sessionCompletedTitle => 'Сессия завершена!';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts очков';
  }

  @override
  String sessionStreakMessage(int days) {
    return '$days дней подряд 🔥';
  }

  @override
  String get sessionDiaryPrompt => 'Как прошло?';

  @override
  String get sessionMinimumNotMet =>
      'Сессии менее 5 минут не учитываются в счёте';

  @override
  String get dashboardTitle => 'Статистика';

  @override
  String get dashboardOfflineScore => 'Офлайн-счёт';

  @override
  String dashboardPercentile(int pct) {
    return 'Топ $pct% семей';
  }

  @override
  String get dashboardTimeTogether => 'Время вместе';

  @override
  String get dashboardSessions => 'Сессии';

  @override
  String get dashboardStreak => 'Серия';

  @override
  String get dashboardBestSession => 'Лучшая сессия';

  @override
  String get dashboardPeriodWeek => 'Неделя';

  @override
  String get dashboardPeriodMonth => 'Месяц';

  @override
  String get dashboardPeriodAll => 'Вся история';

  @override
  String get dashboardPremiumRequired => 'Открыть полную историю';

  @override
  String get ritualsTitle => 'Занятия';

  @override
  String get ritualsSuggestedNow => 'Предлагается сейчас';

  @override
  String get ritualsOther => 'Другие занятия';

  @override
  String get ritualsStartThis => 'Начать это занятие ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min мин';
  }

  @override
  String get familyTitle => 'Семья';

  @override
  String familyMembers(int count) {
    return 'Участники ($count)';
  }

  @override
  String get familyActiveNow => 'Сейчас онлайн';

  @override
  String get familyInvitePending => 'Приглашение ожидает';

  @override
  String get familyInviteMember => '+ Пригласить члена семьи';

  @override
  String get familyInviteLink => 'Скопировать ссылку-приглашение';

  @override
  String get familyInviteLinkCopied => 'Ссылка скопирована!';

  @override
  String get familyRoleAdmin => 'Администратор';

  @override
  String get familyRoleAdult => 'Взрослый';

  @override
  String get familyRoleYoung => 'Молодой';

  @override
  String familyPointsLabel(int pts) {
    return '$pts очков';
  }

  @override
  String get diaryTitle => 'Дневник';

  @override
  String get diaryHowWasIt => 'Как прошло?';

  @override
  String get diaryAddNote => 'Добавить заметку (необязательно)';

  @override
  String get diaryNoteHint => 'Несколько слов об этом моменте…';

  @override
  String diarySessionDuration(int min) {
    return '$min мин вместе';
  }

  @override
  String get diaryNoEntries =>
      'В дневнике пока нет записей.\nНачните первую сессию присутствия!';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsNotifications => 'Уведомления';

  @override
  String get settingsNotificationsRituals => 'Предложения занятий';

  @override
  String get settingsNotificationsStreak => 'Напоминания о серии';

  @override
  String get settingsNotificationsFamily => 'Активность семьи';

  @override
  String get settingsPrivacy => 'Конфиденциальность';

  @override
  String get settingsBiometric => 'Face ID / Отпечаток пальца';

  @override
  String get settingsMfa => 'Двухфакторная аутентификация';

  @override
  String get settingsExportData => 'Экспортировать мои данные';

  @override
  String get settingsDeleteAccount => 'Удалить аккаунт';

  @override
  String get settingsSubscription => 'Подписка';

  @override
  String get settingsSignOut => 'Выйти';

  @override
  String settingsVersion(String version) {
    return 'Версия $version';
  }

  @override
  String get paywallTitle => 'Будьте здесь';

  @override
  String get paywallSubtitle => 'Дешевле чашки кофе в месяц для всей семьи.';

  @override
  String get paywallTrialBadge => '21 день бесплатно';

  @override
  String get paywallPlanFamily => 'Семейный';

  @override
  String get paywallPlanFamilyDesc => 'Все включены. Один план.';

  @override
  String get paywallPlanIndividual => 'Личный';

  @override
  String get paywallPlanIndividualDesc => 'Индивидуальный премиум-опыт.';

  @override
  String get paywallPerMonth => '/мес';

  @override
  String get paywallStartTrial => 'Начать бесплатный период';

  @override
  String get paywallNoCard => 'Без банковской карты';

  @override
  String get paywallMaybeLater => 'Может быть, позже';

  @override
  String get paywallVsBuiltIn =>
      'В отличие от Screen Time от Apple или Digital Wellbeing от Google — мы не просто говорим СТОП. Мы говорим СДЕЛАЙ ЭТО ВМЕСТО.';

  @override
  String get paywallRestorePurchases => 'Восстановить покупки';

  @override
  String get errorGeneric => 'Что-то пошло не так. Попробуйте ещё раз.';

  @override
  String get errorNetwork => 'Нет подключения к интернету';

  @override
  String get errorAuthFailed => 'Ошибка аутентификации';

  @override
  String get errorInvalidEmail => 'Введите корректный email';

  @override
  String get errorSessionMinimum => 'Минимальная длительность сессии: 5 минут';

  @override
  String notifRitualTitle(String family) {
    return 'Добрый вечер, $family 🌿';
  }

  @override
  String get notifRitualBody => 'Отличное время для 30 минут вместе.';

  @override
  String get notifStreakTitle => 'Ваша серия под угрозой 🔥';

  @override
  String notifStreakBody(int days) {
    return 'У вас $days дней подряд. Не прерывайте сейчас!';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return '$name присоединился к $family!';
  }

  @override
  String get notifTrialEndingTitle => 'Бесплатный период скоро заканчивается ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return 'Осталось $days дней. Продолжайте дешевле чашки кофе в месяц.';
  }
}
