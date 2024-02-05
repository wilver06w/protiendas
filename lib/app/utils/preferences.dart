library mobile_client_preferences;

import 'dart:convert';

import 'package:protiendas/app/models/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _singleton = Preferences._();

  factory Preferences() => _singleton;

  Preferences._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  final String _traceIdKey = 'trace_id';
  String get traceId => _prefs?.getString(_traceIdKey) ?? '';
  set traceId(String value) => _prefs?.setString(_traceIdKey, value);

  final String _isRefreshingTokenKey = 'is_refreshing_token';
  bool get isRefreshingToken => _prefs?.getBool(_isRefreshingTokenKey) ?? false;
  set isRefreshingToken(bool value) =>
      _prefs?.setBool(_isRefreshingTokenKey, value);

  final String _countryKey = 'country';
  String get country => _prefs?.getString(_countryKey) ?? 'CO';
  set country(String value) => _prefs?.setString(_countryKey, value);

  final String _tokenKey = 'token';
  String get token => _prefs?.getString(_tokenKey) ?? '';
  set token(String value) => _prefs?.setString(_tokenKey, value);

  final String _msTokenKey = 'msToken';
  Token? get msToken {
    final value = _prefs?.getString(_msTokenKey);

    if (value != null) {
      final tokenData = json.decode(value);
      final token = Token.fromJson(tokenData);

      return token;
    }

    return null;
  }

  set msToken(Token? value) {
    final token = json.encode(value?.toJson() ?? {});

    _prefs?.setString(_msTokenKey, token);

    return;
  }

  final String _isLoggedKey = 'is_logged';
  bool get isLogged => _prefs?.getBool(_isLoggedKey) ?? false;
  set isLogged(bool value) => _prefs?.setBool(_isLoggedKey, value);

//TODO: revisar para crearlo.
  // final String _userKey = 'user';
  // User? get user {
  //   final value = _prefs?.getString(_userKey);

  //   if (value != null) {
  //     final userData = json.decode(value);
  //     final user = User.fromJson(userData);

  //     return user;
  //   }

  //   return null;
  // }

  // set user(User? value) {
  //   final token = json.encode(value?.toJson() ?? {});

  //   _prefs?.setString(_userKey, token);

  //   return;
  // }W

  Future<void> reload() async {
    await _prefs?.reload();
  }

  Future<void> clear() async {
    await _prefs?.clear();
    token = '';
    msToken = null;
    //TODO: descomentar mas adelante.
    // user = null;
    country = '';
    isLogged = false;
  }
}
