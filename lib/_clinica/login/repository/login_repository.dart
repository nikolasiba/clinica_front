import 'package:clinica/_clinica/login/domain/interface/i_login.dart';
import 'package:clinica/_clinica/services/apis/apis.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:clinica/_clinica/services/data/remote/network/network_api_service.dart';
import 'package:either_dart/either.dart';

class LoginRepository implements ILogin {
  @override
  Future<Either<NetworkException, dynamic>> login(
      {required String email, required String password}) async {
    var apiService = NetworkApiService();

    Object body = {"email": email, "password": password};

    String url = Apis.login;

    dynamic response = await apiService.postResponse(url, body);
    return response;
  }
}
