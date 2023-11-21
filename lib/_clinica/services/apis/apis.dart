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
  static final updatePatientProfile = '$localHost/api/patient/edit-account';

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

  //doctor
  static final getAppointmentToday =
      '$localHost/api/doctor/get-actual-appointment';
  static final getAppointmentByDoctor = '$localHost/api/doctor/get-appointment';
  static final getListFinishedAndCancelledAppointments =
      '$localHost/api/doctor/get-cancelled-finished-appointments';
  static final requestVacations = '$localHost/api/doctor/assign-day-off';
  //

  static final uploadPicture = '$localHost/api/images/upload';
  //
  static final getPetitions = '$localHost/api/patient/get-petition-by-patient';
}
