import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferences_controller extends GetxController {
  late SharedPreferences _prefs;
  Future<SharedPreferences_controller> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  String get token {
    return _prefs.getString('token') ?? '';
  }

  Future<void> setToken(String token) async {
    await _prefs.setString('token', token);
  }

  bool get isLoggedIn {
    return token.isNotEmpty;
  }

  Future<void> clearToken() async {
    await _prefs.remove('token');
  }

  String get languages {
    return _prefs.getString('languages') ?? "";
  }

  Future<void> setLanguages(String languages) async {
    await _prefs.setString('languages', languages);
  }

  bool get isLanguages {
    return languages.isNotEmpty;
  }
}
