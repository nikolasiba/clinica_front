import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

abstract class IPetition {
  Future<Either<NetworkException, dynamic>> getPetitions({required int id});

  Future<dynamic> createPetition();
}
