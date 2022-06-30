import 'package:fixnit/app.dart';
import 'package:fixnit/setup.dart';
import 'package:flutter/material.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(locateService<App>());
}





