library mobile_client_preferences;

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _singleton = Preferences._();

  factory Preferences() => _singleton;

  Preferences._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  final String _languageKey = 'country';
  String get language => _prefs?.getString(_languageKey) ?? 'ES';
  set language(String value) => _prefs?.setString(_languageKey, value);


  Future<void> reload() async {
    await _prefs?.reload();
  }
}
