import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.label, this.obscure = false, required this.controllerText});

  final String label;
  final bool obscure;
  final TextEditingController controllerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        cursorColor: Colors.black,
        controller: controllerText,
        obscureText: obscure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(          
            borderSide: BorderSide(color: Color.fromRGBO(255, 192, 0, 10))
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black
          ),
        ),
      ),
    );
  }
}