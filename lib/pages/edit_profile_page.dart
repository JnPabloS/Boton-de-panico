import 'package:boton_panico/widgets/edit_profile_widget.dart';
import 'package:flutter/material.dart';

import 'configuration_page.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        title: const Text(
            "Configuración",
            style: TextStyle(
              color: Color.fromRGBO(255, 192, 0, 10),
              fontWeight: FontWeight.bold,
            ),
          ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(255, 192, 0, 10),
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(
                    builder: (BuildContext context){
                      return const ConfigurationPage();
                      },
                    ),  (Route<dynamic> route) => false,
            );
          },
        ),

        backgroundColor: Colors.white,
        shadowColor: const Color.fromRGBO(255, 192, 0, 10),
        //shadowColor: const Color.fromRGBO(255, 192, 0, 10),
      ),

      body: const EditProfileWidget(),
    );
  }
}