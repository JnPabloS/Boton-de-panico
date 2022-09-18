import 'package:boton_panico/pages/button_alert_page.dart';
import 'package:boton_panico/widgets/form_event_widget.dart';
import 'package:flutter/material.dart';

class FormEventPage extends StatelessWidget {
  const FormEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(255, 192, 0, 10),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        //shadowColor: const Color.fromRGBO(255, 192, 0, 10),
      ),

      body : const FormEventWidget()
    );
  }
}

// Navigator.pushNamed(context, "formEvent", arguments: {'tipo' : tipo, 'lat' : args['lat'], 'lon' : args['lon']});