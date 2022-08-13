import 'package:shared_preferences/shared_preferences.dart';

class SessionDataProviderKeys {
  static const _apiKey = 'api_key';
}

class SessionDataProvider {
  final _sharedPregerences = SharedPreferences.getInstance();

  Future<String?> apiKey() async {
    return (await _sharedPregerences)
        .getString(SessionDataProviderKeys._apiKey);
  }

  Future<void> saveApiKey(String key) async {
    (await _sharedPregerences).setString(SessionDataProviderKeys._apiKey, key);
  }

  Future<void> clearApiKey() async {
    (await _sharedPregerences).remove(SessionDataProviderKeys._apiKey);
  }
}