import 'package:useful_articles_app/commands/command.dart';

abstract class AsyncCommand extends Command {
  AsyncCommand(super.context);

  @override
  void run() async {
    var origState = currentStateId();
    try {
      await changeState("busy");
      await execCommand();
      await changeState(nextState());
    } catch (e) {
      print(e);
      await changeState(origState);
    }
  }

  Future<void> changeState(String newState) async {
    setState(newState);
  }

  Future<void> execCommand();
}
