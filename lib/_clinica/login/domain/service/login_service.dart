import 'package:clinica/_clinica/login/domain/interface/i_login.dart';

class LoginService {
  final ILogin iLogin;

  LoginService(this.iLogin);

  Future<bool> login() async {
    return await iLogin.login();
  }
}
