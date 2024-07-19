import 'package:rahaf/core/shared/datasources/local/cache_helper.dart';

class AppLocal extends CacheHelper {
  final String _token = 'token';

  Future<bool> saveToken(String token) async {
    return await saveData(key: _token, value: token);
  }

  Future<String?> getToken() async {
    return await getData(_token);
  }
}
