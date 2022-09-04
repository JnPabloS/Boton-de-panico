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
              const Text(
                "Boton de pánico", 
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
              
              const Image(
                image: AssetImage("assets/logo.png"),
              ),

              TextFieldWidget(
                label: "Username", 
                controllerText: userController
              ),

              TextFieldWidget(
                label: "Password", 
                controllerText: passController,
                obscure: true,)
            ],
          )
        ),
      )
    );
  }
}