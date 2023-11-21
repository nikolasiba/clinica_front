import 'package:either_dart/either.dart';

import '../../../../services/data/remote/error/network_error.dart';
import '../interface/i_request_vacations.dart';

class RequestVacationsService {
  final IRequestVacations iRequestVacations;
  RequestVacationsService(this.iRequestVacations);

  Future<Either<NetworkException, dynamic>> requestVacations(
      {required Object data}) async {
    return await iRequestVacations.requestVacations(data: data);
  }
}
