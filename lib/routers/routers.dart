import 'package:fixnit/screens/login/bloc/login_cubit.dart';
import 'package:fixnit/screens/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter router(BuildContext context, String? initialLocation) => GoRouter(
  initialLocation: initialLocation ?? Routes.login,
  debugLogDiagnostics: true,
  refreshListenable: GoRouterRefreshStream(context.read<LoginCubit>().stream),
  routes: [
    /*GoRoute(
      path: Routes.signup,
      builder: (context, state) {
        return const SignUpPage();
      },
    ),*/
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return  LoginScreen();
      },
    ),
  /*  GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),*/
  ],
  redirect: (state) {
    final loggingIn = state.subloc == Routes.login;
    final signingUp = state.subloc == Routes.signup;

    if (signingUp) {
      return null;
    }
    Routes.login;


    return null;
  },
);

class Routes {
  static const signup = '/signup';
  static const login = '/login';
  static const home = '/home';
}
