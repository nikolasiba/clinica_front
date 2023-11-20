import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/preferences.dart';

import 'package:flutter/material.dart';

class CustomAppMenu extends StatelessWidget {
  CustomAppMenu({super.key});

  final _prefs = Preferences();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints) =>
            _prefs.role == 'Patient' ? _PatientpMenu() : _DoctrMenu());
  }
}

class _PatientpMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstColors.primaryColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          TextButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/profile'),
            child: const Text(
              'Mi Perfil',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/appoinments'),
            child: const Text(
              'Mis citas',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/petitions'),
            child: const Text(
              'Mis Peticiones',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/appointment_detail'),
            child: const Text(
              'Detalle cita',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class _DoctrMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstColors.primaryColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          TextButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/profile'),
            child: const Text(
              'Mi Perfil',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/profile'),
            child: const Text(
              'Mis citas',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/profile'),
            child: const Text(
              'Mis Peticiones',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/manage_agenda'),
            child: const Text(
              'Gestionar Agenda',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/start_day'),
            child: const Text(
              'Iniciar Jornada',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/appointment_detail'),
            child: const Text(
              'Detalle Cita',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
