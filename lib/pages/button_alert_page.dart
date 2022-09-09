import 'package:boton_panico/widgets/button_alert_widget.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class ButtonAlertPage extends StatelessWidget {
  const ButtonAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: Text("Editar perfil"),
                  ),

                  const PopupMenuItem<int>(
                      value: 1,
                      child: Text("Añadir contactos"),
                  ),

                  const PopupMenuItem<int>(
                      value: 2,
                      child: Text("Cerrar sesión"),
                  ),
                ];
              },
              
              onSelected:(value){
                if(value == 0){
                    print("My account menu is selected.");
                }else if(value == 1){
                  print("Settings menu is selected.");
                }else if(value == 2){
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
        body: const ButtonAlertWidget(),
    );
  }
}