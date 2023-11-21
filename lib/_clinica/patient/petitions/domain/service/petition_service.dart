import 'package:clinica/_clinica/patient/petitions/domain/interface/i_petition.dart';
import 'package:clinica/_clinica/services/data/remote/error/network_error.dart';
import 'package:either_dart/either.dart';

class PetitionService {
  final IPetition iPetition;

  PetitionService(this.iPetition);

  Future<Either<NetworkException, dynamic>> getPetition(
      {required int id}) async {
    return await iPetition.getPetitions(id: id);
  }

  Future<dynamic> createPetition({required Object object}) async {
    return await iPetition.createPetition(data: object);
  }

  Future<Either<NetworkException, dynamic>> getFinishedAppointments(
      {required int id}) async {
    return await iPetition.getFinishedAppointments(id: id);
  }
}
