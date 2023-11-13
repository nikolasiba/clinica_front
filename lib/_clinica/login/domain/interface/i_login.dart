import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

abstract class ILogin {
  Future<Either<NetworkException, dynamic>> login({
    required String email,
    required String password,
  });
}
