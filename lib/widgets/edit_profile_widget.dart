import 'package:boton_panico/pages/button_start_page.dart';
import 'package:boton_panico/services/ingreso_services.dart';
import 'package:boton_panico/user_preferences/user_preferences.dart';
import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:boton_panico/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class EditProfileWidget extends StatelessWidget {
  EditProfileWidget({super.key});
  
  final TextEditingController userController        = TextEditingController();
  final TextEditingController nameController        = TextEditingController();
  final TextEditingController lastNameController    = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
    
    final ingresoServices = IngresoServices();
    final prefs = PreferenciasUsuario();

    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Editar perfil", 
                style: TextStyle(
                  color : Color.fromRGBO(255, 192, 0, 10),
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBoxWidget(heightSized: 40),

              TextFieldWidget(label: "Usuario",     controllerText: userController, isEditUserName : true),
              TextFieldWidget(label: "Nombre",      controllerText: nameController, isEditName: true,),
              TextFieldWidget(label: "Apellido" ,   controllerText: lastNameController, isEditLastName: true,),

               const SizedBoxWidget(heightSized: 40),


              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.55,
                  child: ElevatedButton(
                    
                    onPressed: ()  async {
                      prefs.username = userController.text;
                      if(await ingresoServices.editProfile(prefs.username, nameController.text, lastNameController.text, prefs.token)) {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(
                            builder: (BuildContext context){
                              return const ButtonStartPage();
                            },
                          ),  (Route<dynamic> route) => false
                        );
                      }
                    }, 
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(255, 192, 0, 10),
                    ),
                    child: const Text(
                      "Confirmar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),

              const SizedBoxWidget(heightSized: 60),

            ],
          ),
        ),
      ),
    );
  }
}