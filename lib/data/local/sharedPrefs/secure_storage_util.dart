import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  final _storage = const FlutterSecureStorage();

  SecureStorageUtil._();

  static final SecureStorageUtil instance = SecureStorageUtil._();

  final String _keyIsDarkTheme = 'isDarkTheme';

  setIsDarkTheme(bool value) async {
    await _storage.write(key: _keyIsDarkTheme, value: "$value");
  }

  Future<bool> get isDarkTheme async {
    return await _storage.read(key: _keyIsDarkTheme) == "true" ? true : false;
  }
}
