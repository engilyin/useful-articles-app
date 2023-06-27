import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:useful_articles_app/ui/screens/account/account_screen.dart';
import 'package:useful_articles_app/ui/screens/auth/login_screen.dart';
import 'package:useful_articles_app/ui/screens/main/home_screen.dart';
import 'package:useful_articles_app/ui/screens/sys/busy_screen.dart';
import 'package:useful_articles_app/ui/screens/sys/startup_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = [
    AdaptiveRoute(page: HomeRoute.page, path: '/home'),
    AdaptiveRoute(page: AccountRoute.page, path: '/account'),
    AdaptiveRoute(page: LoginRoute.page, path: '/login'),
    AdaptiveRoute(page: BusyRoute.page, path: '/busy'),
    AdaptiveRoute(page: StartupRoute.page, path: '/', initial: true),
  ];
}
