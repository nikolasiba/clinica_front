import 'package:clinica/_clinica/router/route_generator.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:flutter/material.dart';

import '_clinica/ui/layout/main_layout_page.dart';

void main() async {
  final prefs = Preferences();
  //await GetStorage.init();
  await prefs.initPrefs();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clinica',
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      builder: (_, child) {
        return MainLayoutPage(
          child: child ?? Container(),
        );
      },
    );
  }
}
