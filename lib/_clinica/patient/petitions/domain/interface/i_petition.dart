abstract class IPetition {
  Future<dynamic> getPetitions();
  Future<dynamic> getPetition(int id);
  Future<dynamic> createPetition();
}
