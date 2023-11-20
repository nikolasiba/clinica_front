import 'dart:io';

import 'package:clinica/_clinica/login/domain/interface/i_login.dart';
import 'package:clinica/_clinica/login/domain/model/register.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

class LoginService {
  final ILogin iLogin;

  LoginService(this.iLogin);

  Future<Either<NetworkException, dynamic>> login(
      {required String email, required String password}) async {
    return await iLogin.login(email: email, password: password);
  }

  Future<Either<NetworkException, dynamic>> singIn(
      {required RegisterModel registerModel}) async {
    return await iLogin.singIn(registerModel: registerModel);
  }

  Future<Either<NetworkException, dynamic>> changePassword(
      {required String email,
      required String password,
      required String newPassword}) async {
    return await iLogin.changePassword(
        email: email, password: password, newPassword: newPassword);
  }

  Future<Either<NetworkException, dynamic>> uploadPictur(
      {required File file}) async {
    return await iLogin.uploadPictur(file: file);
  }
}
