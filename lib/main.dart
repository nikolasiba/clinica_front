import 'package:clinica/_clinica/doctor/manage_agenda/presentation/controllers/manage_agenda_ctr.dart';
import 'package:clinica/_clinica/login/presentation/controller/login_ctr.dart';
import 'package:clinica/_clinica/patient/appoinment/presentation/controller/appoinment_ctrl.dart';
import 'package:clinica/_clinica/patient/patient_profile/presentation/controller/profile_ctr.dart';
import 'package:clinica/_clinica/router/route_generator.dart';
import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppoinmentController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => PatientProfileController()),
        ChangeNotifierProvider(create: (_) => ManageAgendaController())
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
