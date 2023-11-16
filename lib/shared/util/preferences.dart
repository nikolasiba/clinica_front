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

  get role {
    return _prefs.getString('role') ?? '';
  }

  set role(dynamic value) {
    _prefs.setString('role', value);
  }

  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(dynamic value) {
    _prefs.setString('token', value);
  }
}
