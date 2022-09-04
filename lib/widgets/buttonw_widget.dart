import 'package:boton_panico/services/ingreso_services.dart';
import 'package:flutter/material.dart';

class ButtonW extends StatelessWidget {
  const ButtonW({super.key, required this.labelButton, required this.dependencia});
  final String labelButton;
  final String dependencia;


  @override
  Widget build(BuildContext context) {
    
    final ingresoServices = IngresoServices();
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: SizedBox(
        width: 250,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(255, 192, 0, 10),
          ),
          onPressed: () {
            ingresoServices.login("","");
          }, 
          child: Text(
            labelButton,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}