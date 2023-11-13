import 'package:clinica/_clinica/login/domain/interface/i_login.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

class LoginService {
  final ILogin iLogin;

  LoginService(this.iLogin);

  Future<Either<NetworkException, dynamic>> login(
      {required String email, required String password}) async {
    return await iLogin.login(email: email, password: password);
  }
}
