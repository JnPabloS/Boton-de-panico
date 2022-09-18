import 'package:boton_panico/widgets/button_alert_widget.dart';
import 'package:flutter/material.dart';

class ButtonAlertPage extends StatelessWidget {
  const ButtonAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: ButtonAlertWidget(),
    );
  }
}