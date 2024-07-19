import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    try {
      if (value is String) {
        return await sharedPreferences!.setString(key, value);
      }
      if (value is int) return await sharedPreferences!.setInt(key, value);
      if (value is bool) return await sharedPreferences!.setBool(key, value);

      return await sharedPreferences!.setDouble(key, value);
    } catch (e) {
      rethrow;
    }
  }

  dynamic getData(
    String key,
  ) {
    try {
      return sharedPreferences!.get(key);
    } catch (e) {
      return null;
    }
  }

  Future<bool> removeData({
    required String key,
  }) async {
    try {
      return await sharedPreferences!.remove(key);
    } catch (e) {
      rethrow;
    }
  }

  Future clearData() async {
    try {
      await sharedPreferences?.clear();
    } catch (e) {
      rethrow;
    }
  }
}
