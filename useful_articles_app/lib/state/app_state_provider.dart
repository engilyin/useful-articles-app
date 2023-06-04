import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:useful_articles_app/state/app_states.dart';

class AppStateProvider extends ChangeNotifier {

  static late final SharedPreferences _prefs;

  AppState _state;

  AppStateProvider() : _state = initialState();

  AppState state() {
    return _state;
  }

  void newState(String newStateId) {
    _state = states[newStateId]!;
    notifyListeners();
  }

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static initialState() {
    String? token = _prefs.getString('token');
    return (token != null) ? states['home'] : states['login'];
  }
}
