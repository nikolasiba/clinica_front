import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

abstract class IPatientProfile {
  Future<Either<NetworkException, dynamic>> getPatientProfile(
      {required String code});
  Future<Either<NetworkException, dynamic>> updatePatientProfile(
      {required Object object});
  Future<void> deletePatientProfile();
}
