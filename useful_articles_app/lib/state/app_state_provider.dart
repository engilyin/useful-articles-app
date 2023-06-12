import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:useful_articles_app/models/auth/login_response.dart';

class AppStateProvider extends ChangeNotifier {

  static late final SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? token() {
    return _prefs.getString('token');
  }

  void login(LoginResponse loginResponse) {
    _prefs.setString('token', loginResponse.token);
  }
}
