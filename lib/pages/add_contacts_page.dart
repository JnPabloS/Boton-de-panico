import 'package:boton_panico/pages/configuration_page.dart';
import 'package:boton_panico/widgets/add_contacts_widget.dart';
import 'package:flutter/material.dart';

import 'button_start_page.dart';
import 'login_page.dart';

class AddContactsPage extends StatelessWidget {
  const AddContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          shadowColor: const Color.fromRGBO(255, 192, 0, 10),
          // title: const Text(
          //   "Editar perfil",
          //   style: TextStyle(
          //     color: Color.fromRGBO(255, 192, 0, 10),
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
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
        elevation: 0,
      ),
    
      body: AddContactsWidget(),
    );
  }
}