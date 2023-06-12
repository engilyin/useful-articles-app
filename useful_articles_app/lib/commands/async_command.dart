import 'package:useful_articles_app/commands/command.dart';
import 'package:useful_articles_app/services/commands/current_command_service.dart';
import 'package:useful_articles_app/services/locator.dart';
import 'package:useful_articles_app/ui/router/app_router.dart';

abstract class AsyncCommand extends Command {

  AppRouter? appRouter;
  String? origScreen;

  AsyncCommand() {
    appRouter = locator<AppRouter>();
    origScreen = appRouter!.current.path;
  }

  @override
  void run() async {
    try {
      final currentCommandService = locator<CurrentCommandService>();
      currentCommandService.start(complete);
      await changeScreen('/busy');
    } catch (e) {
      await changeScreen(origScreen!);
    }
  }

  complete() async {
      final currentCommandService = locator<CurrentCommandService>();
    try {
      await execCommand();
      currentCommandService.pushLastError(null);
      await changeScreen(nextScreen());
    } catch (e) {
      currentCommandService.pushLastError(e.toString());
      await changeScreen(origScreen!);
    }
  }

  Future<void> changeScreen(String screen) async {
    await appRouter!.replaceNamed<dynamic>(screen);
  }

  Future<void> execCommand();
}
