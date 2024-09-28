import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _preferences;

  // تهيئة SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // تخزين رابط الصورة
  static Future setId(String id) async {
    await _preferences.setString("id", id);
  }

  // قراءة رابط الصورة
  static String getId() {
    return _preferences.getString("id") ?? "";
  }

  static clearId() {
    _preferences.remove("id");
  }
}
