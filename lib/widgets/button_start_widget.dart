import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:flutter/material.dart';

class ButtonStartWidget extends StatelessWidget {
  const ButtonStartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height:290,width: 290,
            child: ElevatedButton(
              onPressed: () {
                print("EMERGENCIA");
              },
              style: ElevatedButton.styleFrom(
                //primary: Colors.red,
                elevation: 25,
                shadowColor: Colors.red.shade400, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                    
                  ),
                  padding: const EdgeInsets.all(0.0),             // Elimina el borde interior
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color.fromARGB(255, 230, 0, 0), Color.fromARGB(255, 250, 130, 130)],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  borderRadius: BorderRadius.circular(200)
                ),
              )
            ),
          ),

          const SizedBoxWidget(heightSized: 50),

          const Text(
            "Presiona el botón para generar una emergencia",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
            ),
          ),
        ],
      ),
    );
  }
}