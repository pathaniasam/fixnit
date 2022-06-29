// coverage:ignore-file
import 'dart:io';

import 'package:fixnit/screens/login/bloc/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> resolveDependencies(
) async {
  final isTesting = Platform.environment.containsKey('FLUTTER_TEST');

  // Infrastructure



  getIt


  // Blocs
    ..registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}


