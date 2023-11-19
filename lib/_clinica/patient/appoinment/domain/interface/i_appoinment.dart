import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

abstract class IAppoinment {
  Future<Either<NetworkException, dynamic>> getMyAppointments();

  Future<Either<NetworkException, dynamic>> getAvaliableAppoinments(
      {required String specialization});

  Future<Either<NetworkException, dynamic>> createAppoinment(
      {required Object data});
}
