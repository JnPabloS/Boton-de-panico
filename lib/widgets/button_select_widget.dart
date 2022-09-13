import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:flutter/material.dart';


// class SizeConfig {
//  static late MediaQueryData _mediaQueryData;
//  static late double screenWidth;
//  static late double screenHeight ;
//  static late double blockSizeHorizontal;
//  static late double blockSizeVertical;
 
//  void init(BuildContext context) {
//   _mediaQueryData = MediaQuery.of(context);
//   screenWidth = _mediaQueryData.size.width;
//   screenHeight = _mediaQueryData.size.height;
//   blockSizeHorizontal = screenWidth / 100;
//   blockSizeVertical = screenHeight / 100;
//  }
// }

class ButtonSelectWidget extends StatelessWidget {
  const ButtonSelectWidget({super.key, required this.tipo, required this.latitud, required this.longitud});
  
  final String tipo;
  final String latitud;
  final String longitud;
  
  @override
  Widget build(BuildContext context) {
  
    final String imagen      = _imagen(tipo);
    final String labelButton = _label(tipo);

    return Column(
      
      children: [
        SizedBox(
    
          height : 120,
          width  : 120,
          
          child: ElevatedButton(
            onPressed: () {
              print(tipo);
              print(latitud);
              print(longitud);
              Navigator.pushNamed(context, "buttonAlert", arguments: {'tipo' : tipo});
    
            },
    
            style: ElevatedButton.styleFrom( 
                    primary: _color(tipo),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),   
                      ),
                    padding: const EdgeInsets.all(0.0),             
                  ), 
    
            child: Image.asset(
              "assets/$imagen.png",
              height : 70,
              width  : 70,
            ),
          ),
        ),
        
        const SizedBoxWidget(heightSized: 20),
        
        Text(
          labelButton,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black45
          ),
        ),
      ],
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

_label(String labelButton) {
  switch(labelButton) { 
    case "ROBO": { 
        return "Robo";
    } 
    case "ACCIDENTE": { 
        return "Accidente";
    }

    case "INCENDIO": { 
        return "Incendio";
    }  

    case "ARMAS": { 
        return "Venta de armas";
    } 

    case "SUSTANCIAS": { 
        return "Venta de sustancias";
    } 

    case "DESLIZAMIENTO": { 
        return "Deslizamientos";
    }

    case "OTROS": { 
        return "Otros";
    } 

    default: { 
        return "robo";
    }
  } 
}