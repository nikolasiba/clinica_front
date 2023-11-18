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
}
