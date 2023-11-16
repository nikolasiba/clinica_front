import 'package:clinica/_clinica/login/domain/interface/i_login.dart';
import 'package:clinica/_clinica/login/domain/model/register.dart';
import 'package:clinica/_clinica/services/apis/apis.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:clinica/_clinica/services/data/remote/network/network_api_service.dart';
import 'package:either_dart/either.dart';

class LoginRepository implements ILogin {
  @override
  Future<Either<NetworkException, dynamic>> login(
      {required String email, required String password}) async {
    var apiService = NetworkApiService();

    var headers = {"Content-Type": "application/json"};

    Object body = {"email": email, "password": password};

    String url = Apis.login;

    dynamic response =
        await apiService.postResponse(url, body, headers: headers);
    return response;
  }

  @override
  Future<Either<NetworkException, dynamic>> singIn(
      {required RegisterModel registerModel}) async {
    var apiService = NetworkApiService();

    var headers = {"Content-Type": "application/json"};

    Object body = registerModel.toJson();

    String url = Apis.register;

    dynamic response =
        await apiService.postResponse(url, body, headers: headers);
    return response;
  }
}
