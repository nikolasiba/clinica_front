import 'package:either_dart/either.dart';

import '../../../../services/data/remote/error/network_error.dart';

abstract class IRequestVacations {
  Future<Either<NetworkException, dynamic>> requestVacations(
      {required Object data});
}
