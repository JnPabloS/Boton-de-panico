import 'package:boton_panico/widgets/button_select_widget.dart';
import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:flutter/material.dart';

class SelectEmeregencyWidget extends StatelessWidget {
  const SelectEmeregencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBoxWidget(heightSized: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            
            ButtonSelectWidget(tipo: "ROBO",),
            ButtonSelectWidget(tipo: "ACCIDENTE",),
            ButtonSelectWidget(tipo: "INCENDIO",),
          ],
        ),

        const SizedBoxWidget(heightSized: 40),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            
            ButtonSelectWidget(tipo: "ARMAS",),
            ButtonSelectWidget(tipo: "SUSTANCIAS",),
            ButtonSelectWidget(tipo: "DESLIZAMIENTO",),
          ],
        )
      ],
    );
  }
}