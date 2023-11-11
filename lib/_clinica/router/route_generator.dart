import 'package:clinica/_clinica/ui/pages/appoinments_pg.dart';
import 'package:clinica/_clinica/ui/pages/profile_pg.dart';
import 'package:clinica/_clinica/ui/pages/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../ui/pages/pages.dart';
import '../ui/pages/recover_password_pg.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return _fadeRoute(const LoginPage(), '/login');

      case '/recover_password':
        return _fadeRoute(const RecoverPassworPage(), '/recover_password');

      case '/profile':
        return _fadeRoute(const ProfilePage(), '/profile');

      case '/appoinments':
        return _fadeRoute(const AppoinmentPage(), '/appoinments');

      case '/request':
        return _fadeRoute(const RegisterPage(), '/request');

      case '/register':
        return _fadeRoute(const RegisterPage(), '/register');

      default:
        return _fadeRoute(const Page404(), '/404');
    }
  }

  static PageRoute _fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => child,
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (_, animation, __, ___) => (kIsWeb)
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: __,
                linearTransition: true,
                child: child));
  }
}
