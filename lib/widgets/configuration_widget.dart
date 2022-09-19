import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:flutter/material.dart';

class ConfigurationWidget extends StatelessWidget {
  const ConfigurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBoxWidget(heightSized: 5),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.08,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, "editProfile");
            },
            icon: const Icon(
              Icons.edit,
              color: Color.fromRGBO(255, 192, 0, 10),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 0,
            ),
            label: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                " Editar perfil",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            ),
          ),

        SizedBox(
          height: MediaQuery.of(context).size.height*0.08,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, "addContacts");
            },
            icon: const Icon(
              Icons.group_add,
              color: Color.fromRGBO(255, 192, 0, 10),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 0,
            ),
            label: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                " Añadir contactos",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            ),
          ),

          SizedBox(
          height: MediaQuery.of(context).size.height*0.07,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, "changePass");
            },
            icon: const Icon(
              Icons.lock_open,
              color: Color.fromRGBO(255, 192, 0, 10),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 0,
            ),
            label: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                " Cambiar contraseña",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            ),
          ),
        ],
      );
    }
  }