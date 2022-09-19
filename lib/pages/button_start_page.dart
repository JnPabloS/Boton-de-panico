import 'package:boton_panico/pages/login_page.dart';
import 'package:boton_panico/user_preferences/user_preferences.dart';
import 'package:boton_panico/widgets/button_start_widget.dart';
import 'package:flutter/material.dart';

class ButtonStartPage extends StatelessWidget {
  const ButtonStartPage({super.key});

  @override
  Widget build(BuildContext context) {

    final prefs = PreferenciasUsuario();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          shadowColor: const Color.fromRGBO(255, 192, 0, 10),
          title: const Text(
            "Botón de pánico",
            style: TextStyle(
              color: Color.fromRGBO(255, 192, 0, 10),
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                      value: 0,
                      child: Text("Ver perfil"),
                  ),

                  const PopupMenuItem<int>(
                      value: 1,
                      child: Text("Configuración"),
                  ),

                  const PopupMenuItem<int>(
                      value: 2,
                      child: Text("Cerrar sesión"),
                  ),
                ];
              },
              
              onSelected:(value){
                if(value == 0){
                  Navigator.pushNamed(context, "perfil");
                }else if(value == 1){
                  Navigator.pushNamed(context, "config");
                }else if(value == 2){
                  prefs.token = "";
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(
                    builder: (BuildContext context){
                      return const LoginPage();
                      },
                    ),  (Route<dynamic> route) => false,
                  );
                }
              },
            
              icon: const Icon(Icons.more_vert, color: Color.fromRGBO(255, 192, 0, 10)),   
              
            ) ,
          ]
        ),
        body: const ButtonStartWidget(),
    );
  }
}