import 'package:boton_panico/services/ingreso_services.dart';
import 'package:flutter/material.dart';

import '../user_preferences/user_preferences.dart';

class PerfilWidget extends StatelessWidget {
  const PerfilWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final prefs = PreferenciasUsuario();
    final ingresoServices = IngresoServices();
    
    return FutureBuilder(
      future: ingresoServices.seeProfile(prefs.token, prefs.username),
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if(snapshot.hasData){
          final data = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Text(
                  "Información personal",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 192, 0, 10),
                    fontSize: 27,

                  ),
                ),
                Text(data['email']),
                Text(data['username']),
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );




   
    
    
  }

  Future<Map<String,dynamic>> _getData(PreferenciasUsuario prefs, IngresoServices ingresoServices) async {
    final dataServices =  await ingresoServices.seeProfile(prefs.token, prefs.username);
    return dataServices;
  }
}