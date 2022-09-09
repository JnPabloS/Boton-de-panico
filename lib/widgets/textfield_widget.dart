import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.label, this.obscure = false, required this.controllerText, this.isEmail = false, this.isPhone = false});

  final String label;
  final bool obscure;
  final TextEditingController controllerText;
  final bool isEmail;
  final bool isPhone;

  @override
  Widget build(BuildContext context) {

    return Padding(  
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        keyboardType: _validateType(isEmail, isPhone)    ,   //_validateType(isEmail),
        cursorColor: Colors.black45,
        controller: controllerText,
        obscureText: obscure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(          
            borderSide: BorderSide(color: Color.fromRGBO(255, 192, 0, 10))
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}

_validateType(bool isEmail, bool isPhone){
  if (isEmail){
    return TextInputType.emailAddress;
  } else if (isPhone) {
    return TextInputType.phone;
  } else {
    return null;
  }
}