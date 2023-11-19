import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

abstract class IPatientProfile {
  Future<Either<NetworkException, dynamic>> getPatientProfile(
      {required String code});
  Future<void> updatePatientProfile();
  Future<void> deletePatientProfile();
}
