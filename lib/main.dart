import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/providers/locale_provider.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/env.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  await Hive.initFlutter();
  await Hive.openBox<String>('prefs');
  await Hive.openBox<dynamic>('session_cache');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  assert(Env.isConfigured, 'SUPABASE_URL and SUPABASE_ANON_KEY must be set');
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
      autoRefreshToken: true,
    ),
    realtimeClientOptions: const RealtimeClientOptions(eventsPerSecond: 10),
    storageOptions: const StorageClientOptions(retryAttempts: 3),
  );

  await Purchases.setLogLevel(LogLevel.warn);
  final rcKey = defaultTargetPlatform == TargetPlatform.iOS
      ? Env.revenueCatAppleKey
      : Env.revenueCatGoogleKey;
  if (rcKey.isNotEmpty) {
    await Purchases.configure(PurchasesConfiguration(rcKey));
  }

  runApp(const ProviderScope(child: PresentApp()));
}

class PresentApp extends ConsumerWidget {
  const PresentApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Present',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeResolutionCallback: (deviceLocale, supported) {
        if (locale != null) return locale;
        for (final s in supported) {
          if (s.languageCode == deviceLocale?.languageCode &&
              s.countryCode == deviceLocale?.countryCode) return s;
        }
        for (final s in supported) {
          if (s.languageCode == deviceLocale?.languageCode) return s;
        }
        return const Locale('en');
      },
      builder: (context, child) {
        final loc = Localizations.localeOf(context);
        final isRtl = isRtlLocale(loc);
        return Directionality(
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          child: child!,
        );
      },
      routerConfig: router,
    );
  }
}
