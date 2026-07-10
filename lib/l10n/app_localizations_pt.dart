// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Present';

  @override
  String get continueButton => 'Continuar';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get skipButton => 'Saltar';

  @override
  String get doneButton => 'Concluído';

  @override
  String get backButton => 'Voltar';

  @override
  String get saveButton => 'Guardar';

  @override
  String get retryButton => 'Tentar novamente';

  @override
  String get languageScreenTitle => 'Escolhe a tua língua';

  @override
  String get languageScreenSubtitle =>
      'Podes alterar a qualquer momento nas Definições';

  @override
  String get onboardingProblemTitle => 'O ecrã está sempre no meio';

  @override
  String get onboardingProblemBody =>
      'Em média, passamos 4h17 por dia no telemóvel — muitas vezes ao lado das pessoas que mais amamos.';

  @override
  String get onboardingSolutionTitle => 'A Present muda o foco';

  @override
  String get onboardingSolutionBody =>
      'Não bloqueamos. Substituímos. Em vez de fazer scroll, faz algo que realmente importa.';

  @override
  String get onboardingHowTitle => 'Como funciona';

  @override
  String get onboardingHowSteps =>
      '1. Inicia uma Sessão Presente\n2. A família junta-se\n3. Ganham pontos juntos';

  @override
  String get onboardingStartTitle => 'Pronto para estar presente?';

  @override
  String get onboardingStartCta => 'Criar conta';

  @override
  String get onboardingAlreadyHaveAccount => 'Já tenho conta';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count famílias já presentes';
  }

  @override
  String get authSignInWithApple => 'Continuar com Apple';

  @override
  String get authSignInWithGoogle => 'Continuar com Google';

  @override
  String get authEmailPlaceholder => 'o.teu@email.com';

  @override
  String get authSendMagicLink => 'Enviar magic link';

  @override
  String authMagicLinkSent(String email) {
    return 'Verifica o email — link enviado para $email';
  }

  @override
  String get authNoPassword => 'Sem password. Mais seguro.';

  @override
  String get authOr => 'ou';

  @override
  String get authBiometricPrompt => 'Autentica para continuar';

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
    return 'Passo $current de $total';
  }

  @override
  String get setupProfileTitle => 'Qual é o teu nome?';

  @override
  String get setupProfileNameHint => 'O teu nome';

  @override
  String get setupFamilyTitle => 'Dá um nome à tua família';

  @override
  String get setupFamilyHint => 'ex: Família Silva';

  @override
  String get setupFamilyRole => 'O teu papel';

  @override
  String get setupRoleAdult => 'Adulto';

  @override
  String get setupRoleYoung => 'Jovem';

  @override
  String get setupInviteTitle => 'Convida a tua família';

  @override
  String get setupInviteSubtitle => 'Opcional — podes fazer isto mais tarde';

  @override
  String get setupInviteEmailHint => 'Email do familiar';

  @override
  String get setupInviteAddAnother => '+ Adicionar outro';

  @override
  String get setupCreateFamily => 'Criar família →';

  @override
  String get setupCanInviteLater => 'Podes convidar mais tarde';

  @override
  String homeGreeting(String name) {
    return 'Olá, $name 👋';
  }

  @override
  String get homeOfflineScoreLabel => 'Offline Score Semanal';

  @override
  String homeScoreUp(int pts) {
    return '↑ ${pts}pts vs semana passada';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ ${pts}pts vs semana passada';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count presente(s)';
  }

  @override
  String get homeMemberOffline => 'offline';

  @override
  String get homeStartSession => '▶  Iniciar Sessão Presente';

  @override
  String get homeRitualSuggested => 'Ritual sugerido';

  @override
  String get homeDiaryThisWeek => 'Diário desta semana';

  @override
  String get sessionTitle => 'Sessão Presente';

  @override
  String get sessionMinutesTogether => 'minutos juntos';

  @override
  String get sessionStartNow => 'Começar já';

  @override
  String get sessionEndButton => 'Terminar sessão';

  @override
  String sessionEndConfirm(int duration) {
    return 'Terminar sessão de $duration minutos?';
  }

  @override
  String get sessionKeepGoing => 'Continuar';

  @override
  String get sessionCheckInPrompt => 'Ainda estás presente? ✋';

  @override
  String get sessionCheckInYes => 'Sim, ainda aqui';

  @override
  String get sessionCheckInNo => 'Distraí-me';

  @override
  String get sessionCompletedTitle => 'Sessão concluída!';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts pontos';
  }

  @override
  String sessionStreakMessage(int days) {
    return '$days dias seguidos 🔥';
  }

  @override
  String get sessionDiaryPrompt => 'Como correu?';

  @override
  String get sessionMinimumNotMet =>
      'Sessões com menos de 5 minutos não contam para o score';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardOfflineScore => 'Offline Score';

  @override
  String dashboardPercentile(int pct) {
    return 'Top $pct% das famílias';
  }

  @override
  String get dashboardTimeTogether => 'Tempo juntos';

  @override
  String get dashboardSessions => 'Sessões';

  @override
  String get dashboardStreak => 'Sequência';

  @override
  String get dashboardBestSession => 'Melhor sessão';

  @override
  String get dashboardPeriodWeek => 'Semana';

  @override
  String get dashboardPeriodMonth => 'Mês';

  @override
  String get dashboardPeriodAll => 'Histórico';

  @override
  String get dashboardPremiumRequired => 'Desbloquear histórico completo';

  @override
  String get ritualsTitle => 'Rituais';

  @override
  String get ritualsSuggestedNow => 'Sugerido agora';

  @override
  String get ritualsOther => 'Outros rituais';

  @override
  String get ritualsStartThis => 'Iniciar este ritual ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min min';
  }

  @override
  String get familyTitle => 'Família';

  @override
  String familyMembers(int count) {
    return 'Membros ($count)';
  }

  @override
  String get familyActiveNow => 'Activo agora';

  @override
  String get familyInvitePending => 'Convite pendente';

  @override
  String get familyInviteMember => '+ Convidar familiar';

  @override
  String get familyInviteLink => 'Copiar link de convite';

  @override
  String get familyInviteLinkCopied => 'Link copiado!';

  @override
  String get familyRoleAdmin => 'Admin';

  @override
  String get familyRoleAdult => 'Adulto';

  @override
  String get familyRoleYoung => 'Jovem';

  @override
  String familyPointsLabel(int pts) {
    return '${pts}pts';
  }

  @override
  String get diaryTitle => 'Diário';

  @override
  String get diaryHowWasIt => 'Como correu?';

  @override
  String get diaryAddNote => 'Adicionar nota (opcional)';

  @override
  String get diaryNoteHint => 'Algumas palavras sobre este momento…';

  @override
  String diarySessionDuration(int min) {
    return '$min min juntos';
  }

  @override
  String get diaryNoEntries =>
      'Ainda sem entradas no diário.\nInicia a tua primeira Sessão Presente!';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get settingsLanguage => 'Língua';

  @override
  String get settingsNotifications => 'Notificações';

  @override
  String get settingsNotificationsRituals => 'Sugestões de rituais';

  @override
  String get settingsNotificationsStreak => 'Lembretes de sequência';

  @override
  String get settingsNotificationsFamily => 'Actividade familiar';

  @override
  String get settingsPrivacy => 'Privacidade';

  @override
  String get settingsBiometric => 'Face ID / Impressão digital';

  @override
  String get settingsMfa => 'Autenticação de dois factores';

  @override
  String get settingsExportData => 'Exportar os meus dados';

  @override
  String get settingsDeleteAccount => 'Eliminar conta';

  @override
  String get settingsSubscription => 'Subscrição';

  @override
  String get settingsSignOut => 'Terminar sessão';

  @override
  String settingsVersion(String version) {
    return 'Versão $version';
  }

  @override
  String get paywallTitle => 'Fica Presente';

  @override
  String get paywallSubtitle =>
      'Menos do que um café por mês para toda a família.';

  @override
  String get paywallTrialBadge => '21 dias grátis';

  @override
  String get paywallPlanFamily => 'Família';

  @override
  String get paywallPlanFamilyDesc => 'Todos incluídos. Um plano.';

  @override
  String get paywallPlanIndividual => 'Individual';

  @override
  String get paywallPlanIndividualDesc => 'Experiência solo premium.';

  @override
  String get paywallPerMonth => '/mês';

  @override
  String get paywallStartTrial => 'Começar período gratuito';

  @override
  String get paywallNoCard => 'Sem cartão de crédito';

  @override
  String get paywallMaybeLater => 'Talvez mais tarde';

  @override
  String get paywallVsBuiltIn =>
      'Ao contrário do Screen Time da Apple ou do Digital Wellbeing da Google — não dizemos apenas PARA. Dizemos FAZ ISTO EM VEZ DISSO.';

  @override
  String get paywallRestorePurchases => 'Restaurar compras';

  @override
  String get errorGeneric => 'Algo correu mal. Tenta novamente.';

  @override
  String get errorNetwork => 'Sem ligação à internet';

  @override
  String get errorAuthFailed => 'Falha na autenticação';

  @override
  String get errorInvalidEmail => 'Introduz um email válido';

  @override
  String get errorSessionMinimum => 'Tempo mínimo de sessão: 5 minutos';

  @override
  String notifRitualTitle(String family) {
    return 'Boa noite, $family 🌿';
  }

  @override
  String get notifRitualBody => 'Uma boa altura para 30 minutos juntos.';

  @override
  String get notifStreakTitle => 'A vossa sequência está em risco 🔥';

  @override
  String notifStreakBody(int days) {
    return 'Têm $days dias seguidos. Não deixem quebrar agora!';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return '$name juntou-se a $family!';
  }

  @override
  String get notifTrialEndingTitle => 'O período gratuito termina em breve ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return 'Faltam $days dias. Continuem por menos do que um café por mês.';
  }
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appName => 'Present';

  @override
  String get continueButton => 'Continuar';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get skipButton => 'Pular';

  @override
  String get doneButton => 'Concluído';

  @override
  String get backButton => 'Voltar';

  @override
  String get saveButton => 'Salvar';

  @override
  String get retryButton => 'Tentar novamente';

  @override
  String get languageScreenTitle => 'Escolha seu idioma';

  @override
  String get languageScreenSubtitle =>
      'Você pode alterar isso a qualquer momento nas Configurações';

  @override
  String get onboardingProblemTitle => 'A tela está sempre no meio';

  @override
  String get onboardingProblemBody =>
      'Em média, passamos 4h17 por dia no celular — muitas vezes ao lado das pessoas que mais amamos.';

  @override
  String get onboardingSolutionTitle => 'A Present muda o foco';

  @override
  String get onboardingSolutionBody =>
      'Não bloqueamos. Substituímos. Em vez de rolar o feed, faça algo que realmente importa.';

  @override
  String get onboardingHowTitle => 'Como funciona';

  @override
  String get onboardingHowSteps =>
      '1. Inicie uma Sessão Presente\n2. A família se junta\n3. Ganhem pontos juntos';

  @override
  String get onboardingStartTitle => 'Pronto para estar presente?';

  @override
  String get onboardingStartCta => 'Criar conta';

  @override
  String get onboardingAlreadyHaveAccount => 'Já tenho uma conta';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count famílias já presentes';
  }

  @override
  String get authSignInWithApple => 'Continuar com Apple';

  @override
  String get authSignInWithGoogle => 'Continuar com Google';

  @override
  String get authEmailPlaceholder => 'seu@email.com';

  @override
  String get authSendMagicLink => 'Enviar magic link';

  @override
  String authMagicLinkSent(String email) {
    return 'Verifique seu e-mail — link enviado para $email';
  }

  @override
  String get authNoPassword => 'Sem senha. Mais seguro.';

  @override
  String get authOr => 'ou';

  @override
  String get authBiometricPrompt => 'Autentique para continuar';

  @override
  String setupStep(int current, int total) {
    return 'Passo $current de $total';
  }

  @override
  String get setupProfileTitle => 'Qual é o seu nome?';

  @override
  String get setupProfileNameHint => 'Seu nome';

  @override
  String get setupFamilyTitle => 'Dê um nome à sua família';

  @override
  String get setupFamilyHint => 'ex: Família Silva';

  @override
  String get setupFamilyRole => 'Seu papel';

  @override
  String get setupRoleAdult => 'Adulto';

  @override
  String get setupRoleYoung => 'Jovem';

  @override
  String get setupInviteTitle => 'Convide sua família';

  @override
  String get setupInviteSubtitle => 'Opcional — você pode fazer isso depois';

  @override
  String get setupInviteEmailHint => 'E-mail do familiar';

  @override
  String get setupInviteAddAnother => '+ Adicionar outro';

  @override
  String get setupCreateFamily => 'Criar família →';

  @override
  String get setupCanInviteLater => 'Você pode convidar mais tarde';

  @override
  String homeGreeting(String name) {
    return 'Olá, $name 👋';
  }

  @override
  String get homeOfflineScoreLabel => 'Offline Score Semanal';

  @override
  String homeScoreUp(int pts) {
    return '↑ ${pts}pts vs semana passada';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ ${pts}pts vs semana passada';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count presente(s)';
  }

  @override
  String get homeMemberOffline => 'offline';

  @override
  String get homeStartSession => '▶  Iniciar Sessão Presente';

  @override
  String get homeRitualSuggested => 'Ritual sugerido';

  @override
  String get homeDiaryThisWeek => 'Diário desta semana';

  @override
  String get sessionTitle => 'Sessão Presente';

  @override
  String get sessionMinutesTogether => 'minutos juntos';

  @override
  String get sessionStartNow => 'Começar agora';

  @override
  String get sessionEndButton => 'Encerrar sessão';

  @override
  String sessionEndConfirm(int duration) {
    return 'Encerrar sessão de $duration minutos?';
  }

  @override
  String get sessionKeepGoing => 'Continuar';

  @override
  String get sessionCheckInPrompt => 'Ainda está presente? ✋';

  @override
  String get sessionCheckInYes => 'Sim, ainda aqui';

  @override
  String get sessionCheckInNo => 'Me distraí';

  @override
  String get sessionCompletedTitle => 'Sessão concluída!';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts pontos';
  }

  @override
  String sessionStreakMessage(int days) {
    return '$days dias seguidos 🔥';
  }

  @override
  String get sessionDiaryPrompt => 'Como foi?';

  @override
  String get sessionMinimumNotMet =>
      'Sessões com menos de 5 minutos não contam para o score';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardOfflineScore => 'Offline Score';

  @override
  String dashboardPercentile(int pct) {
    return 'Top $pct% das famílias';
  }

  @override
  String get dashboardTimeTogether => 'Tempo juntos';

  @override
  String get dashboardSessions => 'Sessões';

  @override
  String get dashboardStreak => 'Sequência';

  @override
  String get dashboardBestSession => 'Melhor sessão';

  @override
  String get dashboardPeriodWeek => 'Semana';

  @override
  String get dashboardPeriodMonth => 'Mês';

  @override
  String get dashboardPeriodAll => 'Histórico';

  @override
  String get dashboardPremiumRequired => 'Desbloquear histórico completo';

  @override
  String get ritualsTitle => 'Rituais';

  @override
  String get ritualsSuggestedNow => 'Sugerido agora';

  @override
  String get ritualsOther => 'Outros rituais';

  @override
  String get ritualsStartThis => 'Iniciar este ritual ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min min';
  }

  @override
  String get familyTitle => 'Família';

  @override
  String familyMembers(int count) {
    return 'Membros ($count)';
  }

  @override
  String get familyActiveNow => 'Ativo agora';

  @override
  String get familyInvitePending => 'Convite pendente';

  @override
  String get familyInviteMember => '+ Convidar familiar';

  @override
  String get familyInviteLink => 'Copiar link de convite';

  @override
  String get familyInviteLinkCopied => 'Link copiado!';

  @override
  String get familyRoleAdmin => 'Admin';

  @override
  String get familyRoleAdult => 'Adulto';

  @override
  String get familyRoleYoung => 'Jovem';

  @override
  String familyPointsLabel(int pts) {
    return '${pts}pts';
  }

  @override
  String get diaryTitle => 'Diário';

  @override
  String get diaryHowWasIt => 'Como foi?';

  @override
  String get diaryAddNote => 'Adicionar nota (opcional)';

  @override
  String get diaryNoteHint => 'Algumas palavras sobre esse momento…';

  @override
  String diarySessionDuration(int min) {
    return '$min min juntos';
  }

  @override
  String get diaryNoEntries =>
      'Ainda sem entradas no diário.\nInicie sua primeira Sessão Presente!';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsNotifications => 'Notificações';

  @override
  String get settingsNotificationsRituals => 'Sugestões de rituais';

  @override
  String get settingsNotificationsStreak => 'Lembretes de sequência';

  @override
  String get settingsNotificationsFamily => 'Atividade familiar';

  @override
  String get settingsPrivacy => 'Privacidade';

  @override
  String get settingsBiometric => 'Face ID / Impressão digital';

  @override
  String get settingsMfa => 'Autenticação de dois fatores';

  @override
  String get settingsExportData => 'Exportar meus dados';

  @override
  String get settingsDeleteAccount => 'Excluir conta';

  @override
  String get settingsSubscription => 'Assinatura';

  @override
  String get settingsSignOut => 'Sair';

  @override
  String settingsVersion(String version) {
    return 'Versão $version';
  }

  @override
  String get paywallTitle => 'Fique Presente';

  @override
  String get paywallSubtitle =>
      'Menos do que um café por mês para toda a família.';

  @override
  String get paywallTrialBadge => '21 dias grátis';

  @override
  String get paywallPlanFamily => 'Família';

  @override
  String get paywallPlanFamilyDesc => 'Todos incluídos. Um plano.';

  @override
  String get paywallPlanIndividual => 'Individual';

  @override
  String get paywallPlanIndividualDesc => 'Experiência solo premium.';

  @override
  String get paywallPerMonth => '/mês';

  @override
  String get paywallStartTrial => 'Começar período gratuito';

  @override
  String get paywallNoCard => 'Sem cartão de crédito';

  @override
  String get paywallMaybeLater => 'Talvez mais tarde';

  @override
  String get paywallVsBuiltIn =>
      'Ao contrário do Screen Time da Apple ou do Digital Wellbeing do Google — não dizemos apenas PARE. Dizemos FAÇA ISSO EM VEZ DISSO.';

  @override
  String get paywallRestorePurchases => 'Restaurar compras';

  @override
  String get errorGeneric => 'Algo deu errado. Tente novamente.';

  @override
  String get errorNetwork => 'Sem conexão com a internet';

  @override
  String get errorAuthFailed => 'Falha na autenticação';

  @override
  String get errorInvalidEmail => 'Insira um e-mail válido';

  @override
  String get errorSessionMinimum => 'Tempo mínimo de sessão: 5 minutos';

  @override
  String notifRitualTitle(String family) {
    return 'Boa noite, $family 🌿';
  }

  @override
  String get notifRitualBody => 'Uma ótima hora para 30 minutos juntos.';

  @override
  String get notifStreakTitle => 'A sequência de vocês está em risco 🔥';

  @override
  String notifStreakBody(int days) {
    return 'Vocês têm $days dias seguidos. Não deixem quebrar agora!';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return '$name entrou em $family!';
  }

  @override
  String get notifTrialEndingTitle => 'O período gratuito termina em breve ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return 'Faltam $days dias. Continuem por menos do que um café por mês.';
  }
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get appName => 'Present';

  @override
  String get continueButton => 'Continuar';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get skipButton => 'Saltar';

  @override
  String get doneButton => 'Concluído';

  @override
  String get backButton => 'Voltar';

  @override
  String get saveButton => 'Guardar';

  @override
  String get retryButton => 'Tentar novamente';

  @override
  String get languageScreenTitle => 'Escolhe a tua língua';

  @override
  String get languageScreenSubtitle =>
      'Podes alterar a qualquer momento nas Definições';

  @override
  String get onboardingProblemTitle => 'O ecrã está sempre no meio';

  @override
  String get onboardingProblemBody =>
      'Em média, passamos 4h17 por dia no telemóvel — muitas vezes ao lado das pessoas que mais amamos.';

  @override
  String get onboardingSolutionTitle => 'A Present muda o foco';

  @override
  String get onboardingSolutionBody =>
      'Não bloqueamos. Substituímos. Em vez de fazer scroll, faz algo que realmente importa.';

  @override
  String get onboardingHowTitle => 'Como funciona';

  @override
  String get onboardingHowSteps =>
      '1. Inicia uma Sessão Presente\n2. A família junta-se\n3. Ganham pontos juntos';

  @override
  String get onboardingStartTitle => 'Pronto para estar presente?';

  @override
  String get onboardingStartCta => 'Criar conta';

  @override
  String get onboardingAlreadyHaveAccount => 'Já tenho conta';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count famílias já presentes';
  }

  @override
  String get authSignInWithApple => 'Continuar com Apple';

  @override
  String get authSignInWithGoogle => 'Continuar com Google';

  @override
  String get authEmailPlaceholder => 'o.teu@email.com';

  @override
  String get authSendMagicLink => 'Enviar magic link';

  @override
  String authMagicLinkSent(String email) {
    return 'Verifica o email — link enviado para $email';
  }

  @override
  String get authNoPassword => 'Sem password. Mais seguro.';

  @override
  String get authOr => 'ou';

  @override
  String get authBiometricPrompt => 'Autentica para continuar';

  @override
  String setupStep(int current, int total) {
    return 'Passo $current de $total';
  }

  @override
  String get setupProfileTitle => 'Qual é o teu nome?';

  @override
  String get setupProfileNameHint => 'O teu nome';

  @override
  String get setupFamilyTitle => 'Dá um nome à tua família';

  @override
  String get setupFamilyHint => 'ex: Família Silva';

  @override
  String get setupFamilyRole => 'O teu papel';

  @override
  String get setupRoleAdult => 'Adulto';

  @override
  String get setupRoleYoung => 'Jovem';

  @override
  String get setupInviteTitle => 'Convida a tua família';

  @override
  String get setupInviteSubtitle => 'Opcional — podes fazer isto mais tarde';

  @override
  String get setupInviteEmailHint => 'Email do familiar';

  @override
  String get setupInviteAddAnother => '+ Adicionar outro';

  @override
  String get setupCreateFamily => 'Criar família →';

  @override
  String get setupCanInviteLater => 'Podes convidar mais tarde';

  @override
  String homeGreeting(String name) {
    return 'Olá, $name 👋';
  }

  @override
  String get homeOfflineScoreLabel => 'Offline Score Semanal';

  @override
  String homeScoreUp(int pts) {
    return '↑ ${pts}pts vs semana passada';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ ${pts}pts vs semana passada';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count presente(s)';
  }

  @override
  String get homeMemberOffline => 'offline';

  @override
  String get homeStartSession => '▶  Iniciar Sessão Presente';

  @override
  String get homeRitualSuggested => 'Ritual sugerido';

  @override
  String get homeDiaryThisWeek => 'Diário desta semana';

  @override
  String get sessionTitle => 'Sessão Presente';

  @override
  String get sessionMinutesTogether => 'minutos juntos';

  @override
  String get sessionStartNow => 'Começar já';

  @override
  String get sessionEndButton => 'Terminar sessão';

  @override
  String sessionEndConfirm(int duration) {
    return 'Terminar sessão de $duration minutos?';
  }

  @override
  String get sessionKeepGoing => 'Continuar';

  @override
  String get sessionCheckInPrompt => 'Ainda estás presente? ✋';

  @override
  String get sessionCheckInYes => 'Sim, ainda aqui';

  @override
  String get sessionCheckInNo => 'Distraí-me';

  @override
  String get sessionCompletedTitle => 'Sessão concluída!';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts pontos';
  }

  @override
  String sessionStreakMessage(int days) {
    return '$days dias seguidos 🔥';
  }

  @override
  String get sessionDiaryPrompt => 'Como correu?';

  @override
  String get sessionMinimumNotMet =>
      'Sessões com menos de 5 minutos não contam para o score';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardOfflineScore => 'Offline Score';

  @override
  String dashboardPercentile(int pct) {
    return 'Top $pct% das famílias';
  }

  @override
  String get dashboardTimeTogether => 'Tempo juntos';

  @override
  String get dashboardSessions => 'Sessões';

  @override
  String get dashboardStreak => 'Sequência';

  @override
  String get dashboardBestSession => 'Melhor sessão';

  @override
  String get dashboardPeriodWeek => 'Semana';

  @override
  String get dashboardPeriodMonth => 'Mês';

  @override
  String get dashboardPeriodAll => 'Histórico';

  @override
  String get dashboardPremiumRequired => 'Desbloquear histórico completo';

  @override
  String get ritualsTitle => 'Rituais';

  @override
  String get ritualsSuggestedNow => 'Sugerido agora';

  @override
  String get ritualsOther => 'Outros rituais';

  @override
  String get ritualsStartThis => 'Iniciar este ritual ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min min';
  }

  @override
  String get familyTitle => 'Família';

  @override
  String familyMembers(int count) {
    return 'Membros ($count)';
  }

  @override
  String get familyActiveNow => 'Activo agora';

  @override
  String get familyInvitePending => 'Convite pendente';

  @override
  String get familyInviteMember => '+ Convidar familiar';

  @override
  String get familyInviteLink => 'Copiar link de convite';

  @override
  String get familyInviteLinkCopied => 'Link copiado!';

  @override
  String get familyRoleAdmin => 'Admin';

  @override
  String get familyRoleAdult => 'Adulto';

  @override
  String get familyRoleYoung => 'Jovem';

  @override
  String familyPointsLabel(int pts) {
    return '${pts}pts';
  }

  @override
  String get diaryTitle => 'Diário';

  @override
  String get diaryHowWasIt => 'Como correu?';

  @override
  String get diaryAddNote => 'Adicionar nota (opcional)';

  @override
  String get diaryNoteHint => 'Algumas palavras sobre este momento…';

  @override
  String diarySessionDuration(int min) {
    return '$min min juntos';
  }

  @override
  String get diaryNoEntries =>
      'Ainda sem entradas no diário.\nInicia a tua primeira Sessão Presente!';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get settingsLanguage => 'Língua';

  @override
  String get settingsNotifications => 'Notificações';

  @override
  String get settingsNotificationsRituals => 'Sugestões de rituais';

  @override
  String get settingsNotificationsStreak => 'Lembretes de sequência';

  @override
  String get settingsNotificationsFamily => 'Actividade familiar';

  @override
  String get settingsPrivacy => 'Privacidade';

  @override
  String get settingsBiometric => 'Face ID / Impressão digital';

  @override
  String get settingsMfa => 'Autenticação de dois factores';

  @override
  String get settingsExportData => 'Exportar os meus dados';

  @override
  String get settingsDeleteAccount => 'Eliminar conta';

  @override
  String get settingsSubscription => 'Subscrição';

  @override
  String get settingsSignOut => 'Terminar sessão';

  @override
  String settingsVersion(String version) {
    return 'Versão $version';
  }

  @override
  String get paywallTitle => 'Fica Presente';

  @override
  String get paywallSubtitle =>
      'Menos do que um café por mês para toda a família.';

  @override
  String get paywallTrialBadge => '21 dias grátis';

  @override
  String get paywallPlanFamily => 'Família';

  @override
  String get paywallPlanFamilyDesc => 'Todos incluídos. Um plano.';

  @override
  String get paywallPlanIndividual => 'Individual';

  @override
  String get paywallPlanIndividualDesc => 'Experiência solo premium.';

  @override
  String get paywallPerMonth => '/mês';

  @override
  String get paywallStartTrial => 'Começar período gratuito';

  @override
  String get paywallNoCard => 'Sem cartão de crédito';

  @override
  String get paywallMaybeLater => 'Talvez mais tarde';

  @override
  String get paywallVsBuiltIn =>
      'Ao contrário do Screen Time da Apple ou do Digital Wellbeing da Google — não dizemos apenas PARA. Dizemos FAZ ISTO EM VEZ DISSO.';

  @override
  String get paywallRestorePurchases => 'Restaurar compras';

  @override
  String get errorGeneric => 'Algo correu mal. Tenta novamente.';

  @override
  String get errorNetwork => 'Sem ligação à internet';

  @override
  String get errorAuthFailed => 'Falha na autenticação';

  @override
  String get errorInvalidEmail => 'Introduz um email válido';

  @override
  String get errorSessionMinimum => 'Tempo mínimo de sessão: 5 minutos';

  @override
  String notifRitualTitle(String family) {
    return 'Boa noite, $family 🌿';
  }

  @override
  String get notifRitualBody => 'Uma boa altura para 30 minutos juntos.';

  @override
  String get notifStreakTitle => 'A vossa sequência está em risco 🔥';

  @override
  String notifStreakBody(int days) {
    return 'Têm $days dias seguidos. Não deixem quebrar agora!';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return '$name juntou-se a $family!';
  }

  @override
  String get notifTrialEndingTitle => 'O período gratuito termina em breve ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return 'Faltam $days dias. Continuem por menos do que um café por mês.';
  }
}
