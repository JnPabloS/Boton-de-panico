import 'package:boton_panico/pages/add_contacts_page.dart';
import 'package:boton_panico/pages/button_alert_page.dart';
import 'package:boton_panico/pages/button_start_page.dart';
import 'package:boton_panico/pages/configuration_page.dart';
import 'package:boton_panico/pages/edit_profile_page.dart';
import 'package:boton_panico/pages/form_event_page.dart';
import 'package:boton_panico/pages/login_page.dart';
import 'package:boton_panico/pages/otp_page.dart';
import 'package:boton_panico/pages/perfil_page.dart';
import 'package:boton_panico/pages/register_page.dart';
import 'package:boton_panico/pages/select_emergency_page.dart';
import 'package:boton_panico/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Botón de pánico',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      initialRoute: "login",
      routes: {
        "login"       : (context) =>  const LoginPage(),
        "register"    : (context) =>  const RegisterPage(),
        "buttonStart" : (context) =>  const ButtonStartPage(),
        "buttonSelect": (context) =>  const SelectEmergencyPage(),
        "buttonAlert" : (context) =>  const ButtonAlertPage(),
        "addContacts" : (context) =>  const AddContactsPage(),
        "perfil"      : (context) =>  const PerfilPage(),
        "config"      : (context) =>  const ConfigurationPage(),
        "editProfile" : (context) =>  const EditProfilePage(),
        "formEvent"   : (context) =>  const FormEventPage(),
        "otp"         : (context) =>  const OTPPage()
      },
    );
  }
}