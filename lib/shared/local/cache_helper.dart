import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static bool? getBool({required String key}) {
    return sharedPreferences!.getBool(key);
  }

  static Future<bool> setBool(
      {required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }
}
