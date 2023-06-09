import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state_provider.dart';

abstract class Command {
  final BuildContext context;

  Command(this.context);

  void run();

  String nextState();

  setState(String newState) {
    final appStateProvider =
        Provider.of<AppStateProvider>(context, listen: false);
    appStateProvider.newState(newState);
  }

  String currentStateId() {
    final appStateProvider =
    Provider.of<AppStateProvider>(context, listen: false);
    return appStateProvider.state().id;
  }
}
