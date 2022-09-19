import 'package:boton_panico/pages/change_pass_page.dart';
import 'package:boton_panico/widgets/change_passf_widget.dart';
import 'package:flutter/material.dart';

class ChangePassFPage extends StatelessWidget {
  const ChangePassFPage({super.key});

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
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(
              builder: (BuildContext context){
                return const ChangePassPage();
                },
              ),  (Route<dynamic> route) => false,
            );
          },
        ),

        backgroundColor: Colors.white,
        elevation: 0,
        //shadowColor: const Color.fromRGBO(255, 192, 0, 10),
      ),

      body : ChangePassFWidget()
    );
  }
}