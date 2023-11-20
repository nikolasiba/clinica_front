import 'dart:io';

import 'package:clinica/_clinica/login/domain/model/register.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

abstract class ILogin {
  Future<Either<NetworkException, dynamic>> login({
    required String email,
    required String password,
  });

  Future<Either<NetworkException, dynamic>> singIn({
    required RegisterModel registerModel,
  });

  Future<Either<NetworkException, dynamic>> changePassword({
    required String email,
    required String password,
    required String newPassword,
  });

  Future<Either<NetworkException, dynamic>> uploadPictur({required File file});
}
