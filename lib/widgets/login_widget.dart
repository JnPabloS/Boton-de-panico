import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:boton_panico/widgets/textField_widget.dart';
import 'package:flutter/material.dart';
import '../pages/button_start_page.dart';
import '../services/ingreso_services.dart';
import '../user_preferences/user_preferences.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final prefs = PreferenciasUsuario();
    print("PRIMERO: ${prefs.token}");
    final ingresoServices = IngresoServices();

    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              const SizedBoxWidget(heightSized: 100),

              const Image(
                image: AssetImage("assets/logo.png"),
              ),

              const SizedBoxWidget(heightSized: 15),

              const Text(
                "Botón de pánico", 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'
                ),
              ),
              
              const SizedBoxWidget(heightSized: 40),

              TextFieldWidget(
                label: "Usuario", 
                controllerText: userController
              ),

              TextFieldWidget(
                label: "Contraseña", 
                controllerText: passController,
                obscure: true,
              ),
              
              const SizedBoxWidget(heightSized: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(255, 192, 0, 10),
                    ),
                    onPressed: () async {

                      if (userController.text != "" && passController.text != "") {
                        ingresoServices.verifyUser(userController.text);
                      } 

                      bool confirmLogin = await ingresoServices.login(userController.text, passController.text);

                      if (confirmLogin) {
                        //Navigator.popAndPushNamed(context, 'buttonStart');
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(
                          builder: (BuildContext context){
                            return const ButtonStartPage();
                            },
                          ),  (Route<dynamic> route) => false,
                        );
                      }
                      
                     
                    }, 
                    child: const Text(
                      "Iniciar sesión",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("¿No tienes cuenta?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "register");
                    }, 
                    child: const Text(
                      "Regístrate",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 192, 0, 10),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                      ),
                    )
                  )

                ],
              )
            ],
          )
        ),
      )
    );
  }
}
