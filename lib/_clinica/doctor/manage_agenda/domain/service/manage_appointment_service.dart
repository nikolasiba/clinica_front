import 'package:clinica/_clinica/doctor/manage_agenda/domain/interface/i_manage_appointment.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

class ManageAppointmentService {
  final IManageAppointment iManageAppointment;

  ManageAppointmentService(this.iManageAppointment);

  Future<Either<NetworkException, dynamic>> getAppointment(
      {required int doctorCode}) async {
    return await iManageAppointment.getAppointment(doctorCode: doctorCode);
  }
}
