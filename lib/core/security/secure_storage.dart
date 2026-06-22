import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();

  static const _storage = FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
    ),
  );

  static const _kBiometricEnabled = 'biometric_enabled';

  static Future<void> setBiometricEnabled({required bool enabled}) =>
      _storage.write(key: _kBiometricEnabled, value: enabled.toString());

  static Future<bool> getBiometricEnabled() async {
    final val = await _storage.read(key: _kBiometricEnabled);
    return val == 'true';
  }

  static Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  static Future<String?> read(String key) => _storage.read(key: key);

  static Future<void> delete(String key) => _storage.delete(key: key);

  static Future<void> clear() => _storage.deleteAll();
}
