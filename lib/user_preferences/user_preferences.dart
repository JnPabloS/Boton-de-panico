import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set token(String value){
    _prefs.setString('token', value);
  }

  set username(String value){
    _prefs.setString('username', value);
  }

  String get token{
    return _prefs.getString('token') ?? "";
  }
String get username{
    return _prefs.getString('username') ?? "";
  } 
}