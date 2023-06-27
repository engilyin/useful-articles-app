import 'package:auto_route/annotations.dart';
import 'package:flutter/widgets.dart';
import 'package:useful_articles_app/localization/localization.dart';
import 'package:useful_articles_app/services/locator.dart';
import 'package:useful_articles_app/ui/router/app_router.dart';
import 'package:useful_articles_app/ui/widgets/screens/simple_screen.dart';

@RoutePage()
class StartupScreen extends StatelessWidget {
  StartupScreen({Key? key}) : super(key: key);

  final appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {

    dispatch();
    L10n l10n = L10n.of(context)!;

    return SimpleScreen(
        backgroundImage: "login_bg.jpg",
        child: Text(l10n.translate("loading")));
  }

  Future<void> dispatch() async {
    await appRouter.replaceNamed('/login');
  }
}
