//import 'package:boton_panico/pages/button_start_page.dart';
// import 'package:boton_panico/pages/select_emergency_page.dart';
// import 'package:boton_panico/user_preferences/user_preferences.dart';
import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:flutter/material.dart';

class ButtonStartWidget extends StatelessWidget {
  const ButtonStartWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width*0.75,
              width: MediaQuery.of(context).size.width*0.75,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "buttonSelect");
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
      ),
    );
  }
}