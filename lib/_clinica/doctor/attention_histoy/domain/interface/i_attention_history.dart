import 'package:either_dart/either.dart';

import '../../../../services/data/remote/error/network_error.dart';

abstract class IAttentionHistory {
  Future<Either<NetworkException, dynamic>> getAttentionHistory(
      {required int doctorCode});
}
