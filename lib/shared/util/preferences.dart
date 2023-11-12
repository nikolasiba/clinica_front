import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instancia = Preferences._internal();
  factory Preferences() {
    return _instancia;
  }

  Preferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  clear() async {
    await _prefs.clear();
  }

  set nit(String nit) {
    _prefs.setString('nit', nit);
  }

  String get nit {
    return _prefs.getString('nit') ?? '-1';
  }

  set tokenDevice(String tokenDevice) {
    _prefs.setString('tokenDevice', tokenDevice);
  }

  String get tokenDevice {
    return _prefs.getString('tokenDevice') ?? '';
  }

  get loginState {
    return _prefs.getInt('loginState') ?? -1;
  }

  set loginState(dynamic value) {
    _prefs.setInt('loginState', value);
  }

  get branchCode {
    return _prefs.getString('branchCode');
  }

  set branchCode(dynamic value) {
    _prefs.setString('branchCode', value);
  }

  get viewInitAlert {
    return _prefs.getBool('viewInitAlert') ?? false;
  }

  set viewInitAlert(dynamic value) {
    _prefs.setBool('viewInitAlert', value);
  }

  get viewAlertComplementaris {
    return _prefs.getBool('viewAlertComplementaris') ?? false;
  }

  set viewAlertComplementaris(dynamic value) {
    _prefs.setBool('viewAlertComplementaris', value);
  }

  get role {
    return _prefs.getString('role') ?? '';
  }

  set role(dynamic value) {
    _prefs.setString('rol', value);
  }
}
