import 'package:clinica/_clinica/login/domain/interface/i_login.dart';

class LoginRepository implements ILogin {
  @override
  Future<bool> login() async {
    return true;
  }
}
