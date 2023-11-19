import 'package:clinica/_clinica/data_clinic/domain/interface/i_clicnic.dart';

class ClinicService {
  final IClinic iClinic;

  ClinicService(this.iClinic);

  Future getSpecialties() async {
    return await iClinic.getSpecialties();
  }

  Future getCitis() async {
    return await iClinic.getCitis();
  }

  Future getBloodTypes() async {
    return await iClinic.getBloodTypes();
  }

  Future getEPS() async {
    return await iClinic.getEPS();
  }
}
