import 'package:boton_panico/services/ingreso_services.dart';
import 'package:flutter/material.dart';

class PerfilWidget extends StatelessWidget {
  const PerfilWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final ingresoServices = IngresoServices();
    ingresoServices.seeProfile();

    return Column(
      children: const [
        Text("Perfil"),
      ],
    );
  }
}