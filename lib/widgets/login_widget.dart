import 'package:boton_panico/widgets/buttonw_widget.dart';
import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:boton_panico/widgets/textField_widget.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              const SizedBoxW(heightSized: 100),

              const Image(
                image: AssetImage("assets/logo.png"),
              ),

              const SizedBoxW(heightSized: 15),

              const Text(
                "Botón de pánico", 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'
                ),
              ),
              
              const SizedBoxW(heightSized: 40),

              TextFieldWidget(
                label: "Correo", 
                controllerText: userController
              ),

              TextFieldWidget(
                label: "Contraseña", 
                controllerText: passController,
                obscure: true,
              ),
              
              const SizedBoxW(heightSized: 40),

              const ButtonW(labelButton: "Iniciar Sesión", dependencia: 'login'),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("¿No tienes cuenta?"),
                  TextButton(
                    onPressed: () {
                      print("object");
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