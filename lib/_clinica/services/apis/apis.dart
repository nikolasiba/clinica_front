class Apis {
  //
  //

  static int option = 0;

  static String publish = 'https://back-clinic.onrender.com';
  static String localHost = option == 0 ? 'http://localhost:8080' : publish;

  static final login = '$localHost/api/auth/login';
  static final changePassword = '$localHost/api/auth/step2-change-pwd';
  static final register = '$localHost/api/auth/sing-in';

  static final patientProfile = '$localHost/api/patient/get-patient-by-code/';

  //clinic
  static final getListSpecialization =
      '$localHost/api/hospital/get-listSpecialization';
  static final getListCity = '$localHost/api/hospital/get-listCity';
  static final getListBloodType = '$localHost/api/hospital/get-listBloodType';
  static final getListEPS = '$localHost/api/hospital/get-listEps';
  //

  //appoinment
  static final getAvailableAppoinments =
      '$localHost/api/patient/api/check-availability';
  static final createAppoinment = '$localHost/api/patient/create-appointment';
  static final getMyAppointments =
      '$localHost/api/patient/get-patient-schedule';
  static final cancelAppoinment = '$localHost/api/patient/cancel-appointment';
  static final getHistory = '$localHost/api/patient/get-patient-history';
  static final attentionDetail =
      '$localHost/api/patient/get-choosed-appointment';
  //
}
