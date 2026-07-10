// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Present';

  @override
  String get continueButton => '继续';

  @override
  String get cancelButton => '取消';

  @override
  String get skipButton => '跳过';

  @override
  String get doneButton => '完成';

  @override
  String get backButton => '返回';

  @override
  String get saveButton => '保存';

  @override
  String get retryButton => '重试';

  @override
  String get languageScreenTitle => '选择语言';

  @override
  String get languageScreenSubtitle => '您可以随时在设置中更改';

  @override
  String get onboardingProblemTitle => '屏幕总是横在中间';

  @override
  String get onboardingProblemBody => '我们平均每天花4小时17分钟看手机——往往就在最爱的人身旁。';

  @override
  String get onboardingSolutionTitle => 'Present 改变焦点';

  @override
  String get onboardingSolutionBody => '我们不屏蔽。我们替代。与其刷手机，不如做真正重要的事。';

  @override
  String get onboardingHowTitle => '使用方法';

  @override
  String get onboardingHowSteps => '1. 开始陪伴时光\n2. 家人加入\n3. 一起赢得陪伴积分';

  @override
  String get onboardingStartTitle => '准备好陪伴了吗？';

  @override
  String get onboardingStartCta => '创建账户';

  @override
  String get onboardingAlreadyHaveAccount => '已有账户';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count 个家庭已在使用';
  }

  @override
  String get authSignInWithApple => '使用 Apple 继续';

  @override
  String get authSignInWithGoogle => '使用 Google 继续';

  @override
  String get authEmailPlaceholder => '您的邮箱';

  @override
  String get authSendMagicLink => '发送登录链接';

  @override
  String authMagicLinkSent(String email) {
    return '请查收邮件 — 链接已发送至 $email';
  }

  @override
  String get authNoPassword => '无需密码，更加安全。';

  @override
  String get authOr => '或';

  @override
  String get authBiometricPrompt => '验证身份以继续';

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
    return '第 $current 步，共 $total 步';
  }

  @override
  String get setupProfileTitle => '您叫什么名字？';

  @override
  String get setupProfileNameHint => '您的名字';

  @override
  String get setupFamilyTitle => '给您的家庭起个名字';

  @override
  String get setupFamilyHint => '例如：张家';

  @override
  String get setupFamilyRole => '您的角色';

  @override
  String get setupRoleAdult => '成年人';

  @override
  String get setupRoleYoung => '青少年';

  @override
  String get setupInviteTitle => '邀请您的家人';

  @override
  String get setupInviteSubtitle => '可选 — 稍后也可以邀请';

  @override
  String get setupInviteEmailHint => '家人的邮箱';

  @override
  String get setupInviteAddAnother => '+ 添加其他人';

  @override
  String get setupCreateFamily => '创建家庭 →';

  @override
  String get setupCanInviteLater => '稍后可以邀请更多人';

  @override
  String homeGreeting(String name) {
    return '你好，$name 👋';
  }

  @override
  String get homeOfflineScoreLabel => '本周离线分数';

  @override
  String homeScoreUp(int pts) {
    return '↑ 比上周高 $pts 分';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ 比上周低 $pts 分';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count 人在场';
  }

  @override
  String get homeMemberOffline => '不在线';

  @override
  String get homeStartSession => '▶  开始陪伴时光';

  @override
  String get homeRitualSuggested => '推荐活动';

  @override
  String get homeDiaryThisWeek => '本周日记';

  @override
  String get sessionTitle => '陪伴时光';

  @override
  String get sessionMinutesTogether => '分钟共处';

  @override
  String get sessionStartNow => '现在开始';

  @override
  String get sessionEndButton => '结束';

  @override
  String sessionEndConfirm(int duration) {
    return '结束 $duration 分钟的陪伴时光？';
  }

  @override
  String get sessionKeepGoing => '继续';

  @override
  String get sessionCheckInPrompt => '您还在吗？✋';

  @override
  String get sessionCheckInYes => '是的，我在';

  @override
  String get sessionCheckInNo => '我分心了';

  @override
  String get sessionCompletedTitle => '陪伴完成！';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts 分';
  }

  @override
  String sessionStreakMessage(int days) {
    return '连续 $days 天 🔥';
  }

  @override
  String get sessionDiaryPrompt => '感觉怎么样？';

  @override
  String get sessionMinimumNotMet => '不足5分钟的陪伴不计入分数';

  @override
  String get dashboardTitle => '数据';

  @override
  String get dashboardOfflineScore => '离线分数';

  @override
  String dashboardPercentile(int pct) {
    return '超过 $pct% 的家庭';
  }

  @override
  String get dashboardTimeTogether => '共处时长';

  @override
  String get dashboardSessions => '次陪伴';

  @override
  String get dashboardStreak => '连续天数';

  @override
  String get dashboardBestSession => '最长陪伴';

  @override
  String get dashboardPeriodWeek => '本周';

  @override
  String get dashboardPeriodMonth => '本月';

  @override
  String get dashboardPeriodAll => '全部';

  @override
  String get dashboardPremiumRequired => '解锁完整记录';

  @override
  String get ritualsTitle => '活动';

  @override
  String get ritualsSuggestedNow => '当前推荐';

  @override
  String get ritualsOther => '其他活动';

  @override
  String get ritualsStartThis => '开始此活动 ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min 分钟';
  }

  @override
  String get familyTitle => '家庭';

  @override
  String familyMembers(int count) {
    return '成员（$count）';
  }

  @override
  String get familyActiveNow => '当前在线';

  @override
  String get familyInvitePending => '邀请待确认';

  @override
  String get familyInviteMember => '+ 邀请家人';

  @override
  String get familyInviteLink => '复制邀请链接';

  @override
  String get familyInviteLinkCopied => '链接已复制！';

  @override
  String get familyRoleAdmin => '管理员';

  @override
  String get familyRoleAdult => '成年人';

  @override
  String get familyRoleYoung => '青少年';

  @override
  String familyPointsLabel(int pts) {
    return '$pts分';
  }

  @override
  String get diaryTitle => '日记';

  @override
  String get diaryHowWasIt => '感觉怎么样？';

  @override
  String get diaryAddNote => '添加备注（可选）';

  @override
  String get diaryNoteHint => '记录这个美好时刻…';

  @override
  String diarySessionDuration(int min) {
    return '共处 $min 分钟';
  }

  @override
  String get diaryNoEntries => '还没有日记记录。\n开始您的第一次陪伴时光吧！';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsNotificationsRituals => '活动提醒';

  @override
  String get settingsNotificationsStreak => '连续打卡提醒';

  @override
  String get settingsNotificationsFamily => '家庭动态';

  @override
  String get settingsPrivacy => '隐私';

  @override
  String get settingsBiometric => '面容ID / 指纹';

  @override
  String get settingsMfa => '双重验证';

  @override
  String get settingsExportData => '导出数据';

  @override
  String get settingsDeleteAccount => '删除账户';

  @override
  String get settingsSubscription => '订阅';

  @override
  String get settingsSignOut => '退出登录';

  @override
  String settingsVersion(String version) {
    return '版本 $version';
  }

  @override
  String get paywallTitle => '专注当下';

  @override
  String get paywallSubtitle => '每月不到一杯咖啡的价格，全家共享。';

  @override
  String get paywallTrialBadge => '21天免费试用';

  @override
  String get paywallPlanFamily => '家庭版';

  @override
  String get paywallPlanFamilyDesc => '全家共享，一个订阅。';

  @override
  String get paywallPlanIndividual => '个人版';

  @override
  String get paywallPlanIndividualDesc => '个人高级体验。';

  @override
  String get paywallPerMonth => '/月';

  @override
  String get paywallStartTrial => '开始免费试用';

  @override
  String get paywallNoCard => '无需信用卡';

  @override
  String get paywallMaybeLater => '稍后再说';

  @override
  String get paywallVsBuiltIn =>
      '与 Apple 屏幕时间或 Google 数字健康不同 — 我们不只是说停止，我们说用这个来替代。';

  @override
  String get paywallRestorePurchases => '恢复购买';

  @override
  String get errorGeneric => '出错了，请重试。';

  @override
  String get errorNetwork => '无网络连接';

  @override
  String get errorAuthFailed => '验证失败';

  @override
  String get errorInvalidEmail => '请输入有效的邮箱地址';

  @override
  String get errorSessionMinimum => '最短陪伴时间：5分钟';

  @override
  String notifRitualTitle(String family) {
    return '晚上好，$family 🌿';
  }

  @override
  String get notifRitualBody => '现在是一起共度30分钟的好时机。';

  @override
  String get notifStreakTitle => '您的连续记录面临中断 🔥';

  @override
  String notifStreakBody(int days) {
    return '您已连续 $days 天打卡，不要让它中断！';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return '$name 加入了 $family！';
  }

  @override
  String get notifTrialEndingTitle => '免费试用即将结束 ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return '还剩 $days 天。每月不到一杯咖啡，继续陪伴。';
  }
}
