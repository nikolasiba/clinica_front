import 'package:clinica/_clinica/doctor/appointment_detail/presentation/view/appointment_detail_pg.dart';
import 'package:clinica/_clinica/doctor/appointment_history/presentation/view/appointment_history_pg.dart';
import 'package:clinica/_clinica/doctor/attention_histoy/presentation/view/attention_history_pg.dart';
import 'package:clinica/_clinica/doctor/details_agenda/presentation/view/details_agenda_pg.dart';
import 'package:clinica/_clinica/doctor/request_vacation/presentation/view/request_vacation_pg.dart';
import 'package:clinica/_clinica/doctor/start_day/presentation/view/start_day_pg.dart';
import 'package:clinica/_clinica/patient/appoinment/presentation/view/appoinments_pg.dart';
import 'package:clinica/_clinica/patient/appoinment/presentation/view/history_pg.dart';
import 'package:clinica/_clinica/patient/appoinment/presentation/view/select_appoinment.dart';
import 'package:clinica/_clinica/patient/patient_profile/presentation/view/profile_pg.dart';
import 'package:clinica/_clinica/login/presentation/view/register_page.dart';
import 'package:clinica/_clinica/doctor/manage_agenda/presentation/view/manage_agenda_pg.dart';
import 'package:clinica/_clinica/patient/patient_profile/presentation/view/update_data_pg.dart';
import 'package:clinica/_clinica/patient/petitions/presentation/view/create_petition_pg.dart';
import 'package:clinica/_clinica/patient/petitions/presentation/view/petitiont_pg.dart';
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

      case '/select_appoinment':
        return _fadeRoute(const SelectAppoinmentPage(), '/select_appoinment');

      case '/history_appoinment':
        return _fadeRoute(
            const HistoryAppointmentPage(), '/history_appoinment');

      case '/update_data':
        return _fadeRoute(const UpdateDataPage(), '/update_data');

      case '/petitions':
        return _fadeRoute(const PetitionPage(), '/petitions');

      case '/create_petition':
        return _fadeRoute(const CreatePetitionPage(), '/create_petition');

      case '/register':
        return _fadeRoute(const RegisterPage(), '/register');

      case '/manage_agenda':
        return _fadeRoute(const ManageAgendaPage(), '/manage_agenda');

      case '/start_day':
        return _fadeRoute(const StartDayPage(), '/start_day');

      case '/appointment_detail':
        return _fadeRoute(const AppointmentDetailPage(), '/appointment_detail');

      case '/request_vacations':
        return _fadeRoute(const RequestVacationsPage(), '/request_vacations');

      case '/details_agenda':
        return _fadeRoute(const DetailsAgendaPage(), '/details_agenda');

      case '/attention_history':
        return _fadeRoute(const AttentionHistoryPage(), '/attention_history');

      case '/appointment_history':
        return _fadeRoute(
            const AppointmentHistoryPage(), '/appointment_history');

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
