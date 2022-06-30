import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class INavigationService<T> {
  GlobalKey<NavigatorState> get navigatorKey;

  Future<T?> navigateTo({required PageRouteInfo<dynamic> route});
  Future<T?> navigateToRouteName({required String path});
  Future<T?> replace({required PageRouteInfo<dynamic> route});
  Future<T?> replaceNamed({required String path});
  Future<void> pop();
  String get getCurrentPath;
}

class NavigationService extends INavigationService<Object> {
  NavigationService(this._navigatorKey);

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<dynamic> navigateTo({required PageRouteInfo route}) async {
    return await AutoRouter.of(_navigatorKey.currentContext!).push(route);
  }

  @override
  Future<dynamic> navigateToRouteName({required String path}) async {
    return await AutoRouter.of(_navigatorKey.currentContext!).pushNamed(path);
  }

  @override
  Future<dynamic> replace({required PageRouteInfo route}) async {
    return await AutoRouter.of(_navigatorKey.currentContext!).replace(route);
  }

  @override
  Future<dynamic> replaceNamed({required String path}) async {
    return await AutoRouter.of(_navigatorKey.currentContext!)
        .replaceNamed(path);
  }

  @override
  Future<void> pop() async {
    await AutoRouter.of(_navigatorKey.currentContext!).pop();
  }

  @override
  String get getCurrentPath =>
      _navigatorKey.currentContext!.router.current.path;
}
