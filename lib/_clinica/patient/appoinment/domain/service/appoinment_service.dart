import 'package:clinica/_clinica/patient/appoinment/domain/interface/i_appoinment.dart';

class AppoinmentService {
  final IAppoinment iAppoinment;

  AppoinmentService(this.iAppoinment);

  Future<List<dynamic>> getAppointment() async {
    return await iAppoinment.getAppointment();
  }
}
