import 'package:boton_panico/services/ingreso_services.dart';
import 'package:boton_panico/user_preferences/user_preferences.dart';
import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:boton_panico/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../pages/button_start_page.dart';

class AddContactsWidget extends StatelessWidget {
  AddContactsWidget({super.key});

  final TextEditingController nameController    = TextEditingController();
  final TextEditingController lastNameController    = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cellController   = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final ingresoServices = IngresoServices();
    final prefs           = PreferenciasUsuario();

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
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
                
                onPressed: ()  async {
                  if (_validateFields(nameController.text, lastNameController.text, emailController.text, cellController.text)) {
                    if (await ingresoServices.addContacts(nameController.text, lastNameController.text, emailController.text, cellController.text, prefs.username, prefs.refreshToken)) {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(
                          builder: (BuildContext context){
                            return const ButtonStartPage();
                          },
                        ),  (Route<dynamic> route) => false
                      );
                    }
                  } else {
                    Fluttertoast.showToast(
                        msg: "Algún campo está vacío",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black87,
                        textColor: Colors.white,
                        fontSize: 16.0
                      );
                  }
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
      ),
    );
  }
  
  bool _validateFields(String name, String lastname, String email, String phone) {
    if (name.isEmpty || email.isEmpty || lastname.isEmpty || phone.isEmpty) {
      return false;
    }
    return true;
  }
}