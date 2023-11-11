import 'package:clinica/_clinica/services/navigation_service.dart';
import 'package:clinica/locator.dart';
import 'package:clinica/shared/colors/colors.dart';

import 'package:flutter/material.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints) =>
            (constraints.maxWidth > 520) ? _TableDesktopMenu() : _MobileMenu());
  }
}

class _TableDesktopMenu extends StatelessWidget {
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
        ],
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
      ),
    );
  }
}
