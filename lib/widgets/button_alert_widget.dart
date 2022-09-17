import 'dart:async';

import 'package:boton_panico/pages/button_start_page.dart';
import 'package:boton_panico/pages/select_emergency_page.dart';
import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class ButtonAlertWidget extends StatefulWidget {
  const ButtonAlertWidget({super.key});

  @override
  State<ButtonAlertWidget> createState() => _ButtonAlertWidgetState();
}

class _ButtonAlertWidgetState extends State<ButtonAlertWidget> {
  @override
  Widget build(BuildContext context) {

    final args =  (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    final String tipo = args['tipo'];
    final String imagen = _imagen(tipo);
    
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          const Text(
            "28:01",
            style: TextStyle(
              fontSize: 35,
            ),
            ),

          const SizedBoxWidget(heightSized: 40),

          SizedBox(
           height: MediaQuery.of(context).size.width*0.7,
            width: MediaQuery.of(context).size.width*0.7,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(
                    builder: (BuildContext context){
                      return const ButtonStartPage();
                    },
                  ),  (Route<dynamic> route) => false
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: _color(tipo),
                  elevation: 25,
                  //shadowColor: Colors.black38, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                      
                    ),
                    padding: const EdgeInsets.all(0.0),             // Elimina el borde interior
                ),
                child: Image.asset(
                  "assets/$imagen.png",
                  height : 150,
                  width  : 150,
                ),
            ),
          ),

          const SizedBoxWidget(heightSized: 45),

          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width*0.55,
            child: ElevatedButton(
              
              onPressed: () {
                print("SELECT1");
              }, 
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(255, 192, 0, 10),
              ),
              child: const Text(
                "Editar reporte",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          const SizedBoxWidget(heightSized: 25),

          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width*0.55,
            child: ElevatedButton(
              
              onPressed: () {
                Navigator.pop(context);
              }, 
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: const Text(
                "Cambiar reporte",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          SizedBoxWidget(heightSized: MediaQuery.of(context).size.height*0.17),

          const Text(
            "*Presiona el botón central para finalizar tu emergencia",
            style: TextStyle(
              color: Colors.black45
            ),

          ),

          const SizedBoxWidget(heightSized: 10),
        ],
      ),    
    );
  }
  
}

_color(String colorButton) {
  switch(colorButton) { 
    case "ROBO": { 
        return const Color.fromARGB(160, 255, 0, 0);
    } 
    case "ACCIDENTE": { 
        return const Color.fromARGB(160, 254, 233, 68);
    }

    case "INCENDIO": { 
        return const Color.fromARGB(160, 253, 151, 31);
    } 

     case "ARMAS": { 
        return const Color.fromARGB(160, 88, 83, 38);
    } 

    case "SUSTANCIAS": { 
        return const Color.fromARGB(160, 25, 165, 23);
    } 

    case "DESLIZAMIENTO": { 
        return const Color.fromARGB(160, 29, 184, 113);
    }

    case "OTROS": { 
        return const Color.fromARGB(160, 221, 221, 221);
    }   

    default: { 
        return const Color.fromARGB(80, 255, 0, 0);
    }
  } 
}

_imagen(String imagen){
  switch(imagen) { 
    case "ROBO": { 
        return "robo";
    } 
    case "ACCIDENTE": { 
        return "accidente-de-auto";
    }

    case "INCENDIO": { 
        return "extintor-de-incendios";
    }  

    case "ARMAS": { 
        return "armas-de-fuego";
    } 

    case "SUSTANCIAS": { 
        return "marihuana";
    } 

    case "DESLIZAMIENTO": { 
        return "deslizamiento-de-tierra";
    }

    case "OTROS": { 
        return "mas";
    }  

    default: { 
        return "robo";
    }
  } 
}