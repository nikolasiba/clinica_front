import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

abstract class IClinic {
  Future<Either<NetworkException, dynamic>> getSpecialties();

  Future<Either<NetworkException, dynamic>> getCitis();

  Future<Either<NetworkException, dynamic>> getBloodTypes();

  Future<Either<NetworkException, dynamic>> getEPS();
}
