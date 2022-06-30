import 'package:auto_route/auto_route.dart';
import 'package:fixnit/screens/login/login_screen_v.dart';
import 'package:flutter/material.dart';


part 'router.gr.dart';

abstract class Routes {
  static const root = '/';
  static const splash = '/splash';
  static const login = '/login';
}

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[

    CustomRoute(
      page: LoginScreen,
      path: Routes.login,
      transitionsBuilder: TransitionsBuilders.slideRight,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
