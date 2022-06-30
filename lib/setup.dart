import 'package:fixnit/services/navigation/navigation_service.dart';
import 'package:fixnit/services/navigation/router.dart';
import 'package:fixnit/services/network/network_call.dart';
import 'package:fixnit/services/network/network_service.dart';
import 'package:fixnit/setup.config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';


GetIt getIt = GetIt.instance;

T locateService<T extends Object>() => getIt.get<T>();

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configureDependencies() async => $initGetIt(getIt);

// Using a register module (for third party dependencies)
// if you declare a module member as a method instead of a simple accessor, injectable
// will treat it as a factory method, meaning it will inject it's parameters as it would with a regular constructor.
// The same way if you annotate an injected param with @factoryParam injectable will treat it as a factory param.
@module
abstract class RegisterModule {
  static final _appRouter = AppRouter();
  final _navigationService = NavigationService(_appRouter.navigatorKey);
  final _client = Client();

  @Injectable(as: Key)
  UniqueKey get key;

  @singleton
  INavigationService get navigationService => _navigationService;

  @singleton
  INetworkService get network => NetworkCall(client: _client);

  @singleton
  AppRouter get appRouter => _appRouter;
}
