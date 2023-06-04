import 'package:flutter/material.dart';
import 'package:useful_articles_app/ui/screens/auth/login_screen.dart';
import 'package:useful_articles_app/ui/screens/home_screen.dart';
import 'package:useful_articles_app/ui/screens/sys/busy_screen.dart';

class AppState {
  final String id;
  final String route;
  final Widget Function() screen;
  final String previous;

  AppState(this.id, this.previous, this.route, this.screen);
}

List<AppState> appStates = [
  AppState('unknown', '', '', () => const BusyScreen()),
  AppState('busy', '', '', () =>  const BusyScreen()),
  AppState('login', '', '/login', () => const LoginPage()),
  AppState('home', '', '/', () => HomeScreen()),
];

Map<String, AppState> states = appStates.fold(
  {},
      (Map<String, AppState> map, AppState state) {
    map[state.id] = state;
    return map;
  },
);


