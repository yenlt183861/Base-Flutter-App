// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SessionManagerKey {
  static const String TOKEN = 'TOKEN';
  static const String IS_FIRST_OPEN_APP = 'IS_FIRST_OPEN_APP';
}

class SessionManager {
  static final SessionManager instance = SessionManager._();

  factory SessionManager() {
    return instance;
  }

  SessionManager._();

  // token

  Future<bool> saveToken({required String token}) async {
    final myShares = await SharedPreferences.getInstance();
    return myShares.setString(SessionManagerKey.TOKEN, token);
  }

  Future<String> getToken() async {
    final myShares = await SharedPreferences.getInstance();
    return myShares.getString(SessionManagerKey.TOKEN) ?? '';
  }

  Future<bool> removeToken() async {
    final myShares = await SharedPreferences.getInstance();
    return myShares.remove(SessionManagerKey.TOKEN);
  }

  // Is first open app

  Future<bool> saveIsFirstOpenApp() async {
    final myShares = await SharedPreferences.getInstance();
    return myShares.setBool(SessionManagerKey.IS_FIRST_OPEN_APP, false);
  }

  Future<bool> getIsFirstOpenApp() async {
    final myShares = await SharedPreferences.getInstance();
    return myShares.getBool(SessionManagerKey.IS_FIRST_OPEN_APP) ?? true;
  }

  Future<bool> removeIsFirstOpenApp() async {
    final myShares = await SharedPreferences.getInstance();
    return myShares.remove(SessionManagerKey.IS_FIRST_OPEN_APP);
  }

  Future<bool> removeAll() async {
    final myShares = await SharedPreferences.getInstance();
    return myShares.clear();
  }
}
