import 'package:boton_panico/services/ingreso_services.dart';
import 'package:boton_panico/widgets/sizedboxw_widget.dart';
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
          print(data['lastName']);
          return Column(
            children:  [
                Expanded(
                child:  _buildContacts(data['contacts'], data, context),
              ), 
            ],
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  color: Color.fromRGBO(255, 192, 0, 10),
                ),
              ],
            ),
          );
        }
      },
    );    
  }


  _buildContacts(List<dynamic> data, Map<String, dynamic> datos, BuildContext context){
    return ListView.builder(
      itemCount: data.length,                    
      itemBuilder: (context, index) {
        if (index == 0)  {   
        return Column(
          children: [
            const Text(
                  "Información personal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 192, 0, 10),
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBoxWidget(heightSized: 10),
        
            SizedBox(
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    size: MediaQuery.of(context).size.width*0.10,
                    color: const Color.fromARGB(170, 107, 107, 107),
                  ),
                  title: const Text('Usuario'),
                  subtitle: Text(datos['username']),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                child: ListTile(
                  leading: Icon(
                    Icons.badge,
                    size: MediaQuery.of(context).size.width*0.10,
                    color: const Color.fromARGB(170, 107, 107, 107),
                  ),
                  title: const Text("Nombre y apellido"),
                  subtitle: _validateName(datos['name'], datos['lastName']),
                ),
              ),
            ),
        
            SizedBox(
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    size: MediaQuery.of(context).size.width*0.10,
                    color: const Color.fromARGB(170, 107, 107, 107),
                  ),
                  title: const Text('Correo'),
                  subtitle:Text(datos['email']),
                ),
              ),
            ),
            
            const Divider(color: Color.fromRGBO(255, 192, 0, 10),),
        
            const SizedBoxWidget(heightSized: 10),
            const Text(
                  "Contactos de emergencia",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 192, 0, 10),
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            _cardWord(data[index], context),
          ],
        );
        }
        return _cardWord(data[index], context);
      },            
    ); 
  }
  _cardWord(Map<String, dynamic> datos, BuildContext context) {
  return Column(
    children: [
      const SizedBoxWidget(heightSized: 15),
      ListTile(
        leading: Icon(
          Icons.group,
          size: MediaQuery.of(context).size.width*0.10,
          color: const Color.fromARGB(170, 107, 107, 107),
        ),
          title: Text(
          "${datos['name']} ${datos['lastName']}", 
        ),
        subtitle:Text("${datos['cellPhone']} \n${datos['email']}"),
      ),
    ],
  );
}

  _validateName(String? name, String? lastName){
    if (name != "" && lastName != "") {
      return Text("$name $lastName");
    } else if (name != "" && lastName == ""){
      return Text(name!);
    } else if (name == "" && lastName != ""){
      return Text(lastName!);
    } else {
      return const Text('Edita en "configuración"');
    }
  }
}