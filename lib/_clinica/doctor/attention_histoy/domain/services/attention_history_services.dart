import 'package:clinica/_clinica/doctor/attention_histoy/domain/interface/i_attention_history.dart';
import 'package:either_dart/either.dart';

import '../../../../services/data/remote/error/network_error.dart';

class AttentionHistoryServices {
  final IAttentionHistory iAttentionHistory;

  AttentionHistoryServices(this.iAttentionHistory);

  Future<Either<NetworkException, dynamic>> getAttentionHistory(
      {required int doctorCode}) async {
    return await iAttentionHistory.getAttentionHistory(doctorCode: doctorCode);
  }
}
