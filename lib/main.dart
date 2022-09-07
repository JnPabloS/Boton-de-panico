import 'package:boton_panico/pages/button_start_page.dart';
import 'package:boton_panico/pages/login_page.dart';
import 'package:boton_panico/pages/register_page.dart';
import 'package:boton_panico/pages/select_emergency_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
      },
    );
  }
}