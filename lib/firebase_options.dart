import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => android,
      TargetPlatform.iOS => ios,
      _ => throw UnsupportedError('Unsupported platform.'),
    };
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'REPLACE_WEB_API_KEY',
    appId: '1:000000000000:web:0000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'present-app',
    storageBucket: 'present-app.appspot.com',
    authDomain: 'present-app.firebaseapp.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'REPLACE_ANDROID_API_KEY',
    appId: '1:000000000000:android:0000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'present-app',
    storageBucket: 'present-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'REPLACE_IOS_API_KEY',
    appId: '1:000000000000:ios:0000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'present-app',
    storageBucket: 'present-app.appspot.com',
    iosBundleId: 'app.present.ios',
  );
}
