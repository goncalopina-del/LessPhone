// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Present';

  @override
  String get continueButton => 'Lanjutkan';

  @override
  String get cancelButton => 'Batal';

  @override
  String get skipButton => 'Lewati';

  @override
  String get doneButton => 'Selesai';

  @override
  String get backButton => 'Kembali';

  @override
  String get saveButton => 'Simpan';

  @override
  String get retryButton => 'Coba lagi';

  @override
  String get languageScreenTitle => 'Pilih bahasa Anda';

  @override
  String get languageScreenSubtitle =>
      'Anda dapat mengubahnya kapan saja di Pengaturan';

  @override
  String get onboardingProblemTitle => 'Layar selalu ada di antara kita';

  @override
  String get onboardingProblemBody =>
      'Rata-rata kita menghabiskan 4 jam 17 menit sehari di ponsel — sering kali di samping orang-orang yang kita cintai.';

  @override
  String get onboardingSolutionTitle => 'Present mengubah fokus';

  @override
  String get onboardingSolutionBody =>
      'Kami tidak memblokir. Kami mengganti. Alih-alih menggulir, lakukan sesuatu yang benar-benar berarti.';

  @override
  String get onboardingHowTitle => 'Cara kerjanya';

  @override
  String get onboardingHowSteps =>
      '1. Mulai Sesi Bersama\n2. Keluarga bergabung\n3. Kumpulkan poin bersama';

  @override
  String get onboardingStartTitle => 'Siap untuk hadir?';

  @override
  String get onboardingStartCta => 'Buat akun';

  @override
  String get onboardingAlreadyHaveAccount => 'Saya sudah punya akun';

  @override
  String onboardingFamiliesCount(int count) {
    return '$count keluarga sudah bergabung';
  }

  @override
  String get authSignInWithApple => 'Lanjutkan dengan Apple';

  @override
  String get authSignInWithGoogle => 'Lanjutkan dengan Google';

  @override
  String get authEmailPlaceholder => 'email@anda.com';

  @override
  String get authSendMagicLink => 'Kirim tautan masuk';

  @override
  String authMagicLinkSent(String email) {
    return 'Periksa email Anda — tautan dikirim ke $email';
  }

  @override
  String get authNoPassword => 'Tanpa kata sandi. Lebih aman.';

  @override
  String get authOr => 'atau';

  @override
  String get authBiometricPrompt => 'Verifikasi untuk melanjutkan';

  @override
  String setupStep(int current, int total) {
    return 'Langkah $current dari $total';
  }

  @override
  String get setupProfileTitle => 'Siapa nama Anda?';

  @override
  String get setupProfileNameHint => 'Nama Anda';

  @override
  String get setupFamilyTitle => 'Beri nama keluarga Anda';

  @override
  String get setupFamilyHint => 'mis: Keluarga Santoso';

  @override
  String get setupFamilyRole => 'Peran Anda';

  @override
  String get setupRoleAdult => 'Dewasa';

  @override
  String get setupRoleYoung => 'Muda';

  @override
  String get setupInviteTitle => 'Undang keluarga Anda';

  @override
  String get setupInviteSubtitle => 'Opsional — bisa dilakukan nanti';

  @override
  String get setupInviteEmailHint => 'Email anggota keluarga';

  @override
  String get setupInviteAddAnother => '+ Tambah orang lain';

  @override
  String get setupCreateFamily => 'Buat keluarga →';

  @override
  String get setupCanInviteLater => 'Anda bisa mengundang lebih banyak nanti';

  @override
  String homeGreeting(String name) {
    return 'Halo, $name 👋';
  }

  @override
  String get homeOfflineScoreLabel => 'Skor Offline Minggu Ini';

  @override
  String homeScoreUp(int pts) {
    return '↑ $pts poin dari minggu lalu';
  }

  @override
  String homeScoreDown(int pts) {
    return '↓ $pts poin dari minggu lalu';
  }

  @override
  String homeMembersPresent(int count) {
    return '$count hadir';
  }

  @override
  String get homeMemberOffline => 'offline';

  @override
  String get homeStartSession => '▶  Mulai Sesi Bersama';

  @override
  String get homeRitualSuggested => 'Aktivitas yang disarankan';

  @override
  String get homeDiaryThisWeek => 'Jurnal minggu ini';

  @override
  String get sessionTitle => 'Sesi Bersama';

  @override
  String get sessionMinutesTogether => 'menit bersama';

  @override
  String get sessionStartNow => 'Mulai sekarang';

  @override
  String get sessionEndButton => 'Akhiri sesi';

  @override
  String sessionEndConfirm(int duration) {
    return 'Akhiri sesi $duration menit?';
  }

  @override
  String get sessionKeepGoing => 'Lanjutkan';

  @override
  String get sessionCheckInPrompt => 'Apakah Anda masih di sini? ✋';

  @override
  String get sessionCheckInYes => 'Ya, saya di sini';

  @override
  String get sessionCheckInNo => 'Saya terganggu';

  @override
  String get sessionCompletedTitle => 'Sesi selesai!';

  @override
  String sessionCompletedScore(int pts) {
    return '+$pts poin';
  }

  @override
  String sessionStreakMessage(int days) {
    return '$days hari berturut-turut 🔥';
  }

  @override
  String get sessionDiaryPrompt => 'Bagaimana rasanya?';

  @override
  String get sessionMinimumNotMet => 'Sesi kurang dari 5 menit tidak dihitung';

  @override
  String get dashboardTitle => 'Dasbor';

  @override
  String get dashboardOfflineScore => 'Skor Offline';

  @override
  String dashboardPercentile(int pct) {
    return 'Top $pct% keluarga';
  }

  @override
  String get dashboardTimeTogether => 'Waktu bersama';

  @override
  String get dashboardSessions => 'Sesi';

  @override
  String get dashboardStreak => 'Streak';

  @override
  String get dashboardBestSession => 'Sesi terbaik';

  @override
  String get dashboardPeriodWeek => 'Minggu';

  @override
  String get dashboardPeriodMonth => 'Bulan';

  @override
  String get dashboardPeriodAll => 'Semua waktu';

  @override
  String get dashboardPremiumRequired => 'Buka riwayat lengkap';

  @override
  String get ritualsTitle => 'Ritual';

  @override
  String get ritualsSuggestedNow => 'Disarankan sekarang';

  @override
  String get ritualsOther => 'Ritual lainnya';

  @override
  String get ritualsStartThis => 'Mulai ritual ini ▶';

  @override
  String ritualsMinutes(int min) {
    return '$min menit';
  }

  @override
  String get familyTitle => 'Keluarga';

  @override
  String familyMembers(int count) {
    return 'Anggota ($count)';
  }

  @override
  String get familyActiveNow => 'Aktif sekarang';

  @override
  String get familyInvitePending => 'Undangan menunggu';

  @override
  String get familyInviteMember => '+ Undang anggota keluarga';

  @override
  String get familyInviteLink => 'Salin tautan undangan';

  @override
  String get familyInviteLinkCopied => 'Tautan disalin!';

  @override
  String get familyRoleAdmin => 'Admin';

  @override
  String get familyRoleAdult => 'Dewasa';

  @override
  String get familyRoleYoung => 'Muda';

  @override
  String familyPointsLabel(int pts) {
    return '${pts}pts';
  }

  @override
  String get diaryTitle => 'Jurnal';

  @override
  String get diaryHowWasIt => 'Bagaimana rasanya?';

  @override
  String get diaryAddNote => 'Tambah catatan (opsional)';

  @override
  String get diaryNoteHint => 'Beberapa kata tentang momen ini…';

  @override
  String diarySessionDuration(int min) {
    return '$min menit bersama';
  }

  @override
  String get diaryNoEntries =>
      'Belum ada entri jurnal.\nMulai Sesi Bersama pertama Anda!';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get settingsLanguage => 'Bahasa';

  @override
  String get settingsNotifications => 'Notifikasi';

  @override
  String get settingsNotificationsRituals => 'Saran ritual';

  @override
  String get settingsNotificationsStreak => 'Pengingat streak';

  @override
  String get settingsNotificationsFamily => 'Aktivitas keluarga';

  @override
  String get settingsPrivacy => 'Privasi';

  @override
  String get settingsBiometric => 'Face ID / Sidik Jari';

  @override
  String get settingsMfa => 'Autentikasi dua faktor';

  @override
  String get settingsExportData => 'Ekspor data saya';

  @override
  String get settingsDeleteAccount => 'Hapus akun';

  @override
  String get settingsSubscription => 'Langganan';

  @override
  String get settingsSignOut => 'Keluar';

  @override
  String settingsVersion(String version) {
    return 'Versi $version';
  }

  @override
  String get paywallTitle => 'Tetap Hadir';

  @override
  String get paywallSubtitle =>
      'Kurang dari secangkir kopi per bulan untuk seluruh keluarga.';

  @override
  String get paywallTrialBadge => '21 hari gratis';

  @override
  String get paywallPlanFamily => 'Keluarga';

  @override
  String get paywallPlanFamilyDesc => 'Semua termasuk. Satu paket.';

  @override
  String get paywallPlanIndividual => 'Individu';

  @override
  String get paywallPlanIndividualDesc => 'Pengalaman solo premium.';

  @override
  String get paywallPerMonth => '/bulan';

  @override
  String get paywallStartTrial => 'Mulai uji coba gratis';

  @override
  String get paywallNoCard => 'Tanpa kartu kredit';

  @override
  String get paywallMaybeLater => 'Mungkin nanti';

  @override
  String get paywallVsBuiltIn =>
      'Tidak seperti Screen Time Apple atau Digital Wellbeing Google — kami tidak hanya bilang BERHENTI. Kami bilang LAKUKAN INI SEBAGAI GANTINYA.';

  @override
  String get paywallRestorePurchases => 'Pulihkan pembelian';

  @override
  String get errorGeneric => 'Terjadi kesalahan. Coba lagi.';

  @override
  String get errorNetwork => 'Tidak ada koneksi internet';

  @override
  String get errorAuthFailed => 'Autentikasi gagal';

  @override
  String get errorInvalidEmail => 'Masukkan email yang valid';

  @override
  String get errorSessionMinimum => 'Waktu minimum sesi: 5 menit';

  @override
  String notifRitualTitle(String family) {
    return 'Selamat malam, $family 🌿';
  }

  @override
  String get notifRitualBody => 'Waktu yang tepat untuk 30 menit bersama.';

  @override
  String get notifStreakTitle => 'Streak Anda dalam bahaya 🔥';

  @override
  String notifStreakBody(int days) {
    return 'Anda sudah $days hari berturut-turut. Jangan hentikan sekarang!';
  }

  @override
  String notifInviteAcceptedTitle(String name, String family) {
    return '$name bergabung dengan $family!';
  }

  @override
  String get notifTrialEndingTitle => 'Uji coba gratis segera berakhir ⏳';

  @override
  String notifTrialEndingBody(int days) {
    return '$days hari tersisa. Lanjutkan dengan harga kurang dari kopi per bulan.';
  }
}
