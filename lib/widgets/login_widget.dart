import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:boton_panico/widgets/textField_widget.dart';
import 'package:flutter/material.dart';
import '../services/ingreso_services.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();


  @override
  Widget build(BuildContext context) {

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
                    onPressed: () {
                      ingresoServices.login(userController.text, passController.text);
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