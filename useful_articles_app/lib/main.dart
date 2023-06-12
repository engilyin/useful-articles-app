import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:useful_articles_app/localization/local_setup.dart';
import 'package:useful_articles_app/localization/localization.dart';
import 'package:useful_articles_app/services/locator.dart';
import 'package:useful_articles_app/state/app_state_provider.dart';
import 'package:useful_articles_app/ui/router/app_router.dart';
import 'package:useful_articles_app/ui/themes.dart' as themes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStateProvider.init();
  await initLocator();
  runApp(ChangeNotifierProvider<AppStateProvider>(
    create: (_) => AppStateProvider(),
    child: const UsefulArticlesApp(),
  ));
}

class UsefulArticlesApp extends StatelessWidget {
  const UsefulArticlesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();

    return PlatformProvider(
          settings: PlatformSettingsData(
              platformStyle: const PlatformStyleData(web: PlatformStyle.Cupertino)),
          builder: (context) => PlatformApp.router(
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
            material: (_, __) => MaterialAppRouterData(
              theme: themes.primaryMaterialTheme,
              darkTheme: themes.darkMaterialTheme,
            ),
            cupertino: (_, __) => CupertinoAppRouterData(
              theme: themes.primaryCupertinoTheme,
            ),
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
            localeResolutionCallback: loadSupportedLocals,
            onGenerateTitle: (context) =>
            L10n.of(context)!.translate("app-title"),
          ),
    );
  }
}
