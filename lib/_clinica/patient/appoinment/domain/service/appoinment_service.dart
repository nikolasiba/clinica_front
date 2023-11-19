import 'package:clinica/_clinica/patient/appoinment/domain/interface/i_appoinment.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

class AppoinmentService {
  final IAppoinment iAppoinment;

  AppoinmentService(this.iAppoinment);

  Future<Either<NetworkException, dynamic>> getMyAppointment() async {
    return await iAppoinment.getMyAppointments();
  }

  Future<Either<NetworkException, dynamic>> getAvaliableAppoinments(
      {required String specialization}) async {
    return await iAppoinment.getAvaliableAppoinments(
        specialization: specialization);
  }

  Future<Either<NetworkException, dynamic>> createAppoinment(
      {required Object data}) async {
    return await iAppoinment.createAppoinment(data: data);
  }
}
