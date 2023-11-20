import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

abstract class IAppoinment {
  Future<Either<NetworkException, dynamic>> getMyAppointments(
      {required int patientCode});

  Future<Either<NetworkException, dynamic>> getAvaliableAppoinments(
      {required String specialization});

  Future<Either<NetworkException, dynamic>> createAppoinment(
      {required Object data});

  Future<Either<NetworkException, dynamic>> cancelAppoinment(
      {required int appoinmentCode});

  Future<Either<NetworkException, dynamic>> getHistory(
      {required int patientCode});

  Future<Either<NetworkException, dynamic>> attentionDetail(
      {required int appoinmentCode});
}
