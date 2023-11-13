import 'package:clinica/_clinica/patient/petitions/domain/interface/i_petition.dart';

class PetitionService {
  final IPetition iPetition;

  PetitionService({required this.iPetition});

  Future<dynamic> getPetition() async {
    return await iPetition.getPetitions();
  }

  Future<dynamic> getPetitionId(int id) async {
    return await iPetition.getPetition(id);
  }

  Future<dynamic> createPetition() async {
    return await iPetition.createPetition();
  }
}
