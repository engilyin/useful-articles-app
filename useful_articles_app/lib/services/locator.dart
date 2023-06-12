import 'package:get_it/get_it.dart';
import 'package:useful_articles_app/services/commands/current_command_service.dart';

import '../ui/router/app_router.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {

  locator.registerLazySingleton<CurrentCommandService>(() => CurrentCommandService());
  locator.registerLazySingleton<AppRouter>(() => AppRouter());

}