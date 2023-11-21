import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

abstract class IManageAppointment {
  Future<Either<NetworkException, dynamic>> getAppointment(
      {required int doctorCode});
}
