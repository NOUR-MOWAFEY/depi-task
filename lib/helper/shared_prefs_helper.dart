import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static late SharedPreferences _prefs;

  /// Initialize once at app start
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save a string value
  static Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  /// Retrieve a string value
  static Future<String?> getString(String key) async {
    return _prefs.getString(key);
  }

  /// Remove a key
  static Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  /// Clear all stored data
  static Future<void> clear() async {
    await _prefs.clear();
  }
}
