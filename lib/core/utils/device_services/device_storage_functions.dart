import 'package:shared_preferences/shared_preferences.dart';

abstract class DeviceStorageFunctions {
  static Future<void> saveInPreferencesStorage(
      {required String key, required value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case String:
        await preferences.setString(key, value);
        return;
      case int:
        await preferences.setInt(key, value);
        return;
      case double:
        await preferences.setDouble(key, value);
        return;
      case bool:
        await preferences.setBool(key, value);
        return;
      case List<String>:
        await preferences.setStringList(key, value);
        return;
      default:
        throw Exception('Invalid type');
    }
  }

  static Future<dynamic> getFromPreferencesStorage(
      {required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(key);
  }

  static Future<void> removeKeyFromPreferencesStorage(
      {required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(key);
  }
}
