import 'package:boton_panico/services/ingreso_services.dart';
import 'package:boton_panico/user_preferences/user_preferences.dart';
import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:boton_panico/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class AddContactsWidget extends StatelessWidget {
  AddContactsWidget({super.key});

  final TextEditingController nameController    = TextEditingController();
  final TextEditingController lastNameController    = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cellController   = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final ingresoServices = IngresoServices();
    final prefs = PreferenciasUsuario();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          const SizedBoxWidget(heightSized: 30),

          const Text("Añadir contacto", 
          style: TextStyle(
            color : Color.fromRGBO(255, 192, 0, 10),
            fontSize: 40,
            fontWeight: FontWeight.bold
            ),
          ),

          const SizedBoxWidget(heightSized: 30),

          TextFieldWidget(label: "Nombre",      controllerText: nameController),
          TextFieldWidget(label: "Apellido" ,   controllerText: lastNameController),
          TextFieldWidget(label: "Correo",      controllerText: emailController,     isEmail: true,),
          TextFieldWidget(label: "Celular",     controllerText: cellController,  isPhone: true,),

          const SizedBoxWidget(heightSized: 40),

          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width*0.55,
            child: ElevatedButton(
              
              onPressed: ()  {
                ingresoServices.addContacts(nameController.text, lastNameController.text, emailController.text, cellController.text, prefs.username, prefs.token);
              }, 
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(255, 192, 0, 10),
              ),
              child: const Text(
                "Añadir",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
           ),
        ],
      ),
    );
  }
}