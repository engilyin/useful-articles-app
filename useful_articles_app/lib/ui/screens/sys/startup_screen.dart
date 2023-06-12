import 'package:auto_route/annotations.dart';
import 'package:flutter/widgets.dart';
import 'package:useful_articles_app/services/locator.dart';
import 'package:useful_articles_app/ui/router/app_router.dart';

@RoutePage()
class StartupScreen extends StatelessWidget {
  StartupScreen({Key? key}) : super(key: key);

  final appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {

    dispatch();

    return const Placeholder();
  }

  Future<void> dispatch() async {
    await appRouter.replaceNamed('/login');
  }
}
