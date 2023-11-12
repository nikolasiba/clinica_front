import 'package:clinica/_clinica/ui/pages/appoinments_pg.dart';
import 'package:clinica/_clinica/patient_profile/presentation/view/profile_pg.dart';
import 'package:clinica/_clinica/login/presentation/view/register_page.dart';
import 'package:clinica/shared/util/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../login/presentation/view/login_page.dart';
import '../ui/pages/page_404.dart';
import '../login/presentation/view/recover_password_pg.dart';

final prefs = Preferences();

class RouteGenerator {
  final prefs = Preferences();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return _fadeRoute(const LoginPage(), '/login');

      case '/recover_password':
        return _fadeRoute(const RecoverPassworPage(), '/recover_password');

      case '/profile':
        return _fadeRoute(const PatientProfilePage(), '/profile');

      case '/appoinments':
        return _fadeRoute(const PatientAppoinmentPage(), '/appoinments');

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
