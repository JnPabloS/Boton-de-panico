import 'package:boton_panico/widgets/button_alert_widget.dart';
import 'package:flutter/material.dart';
import 'button_start_page.dart';


class ButtonAlertPage extends StatelessWidget {
  const ButtonAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back,
        //       color: Color.fromRGBO(255, 192, 0, 10),
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(
        //         builder: (BuildContext context){
        //           return const ButtonStartPage();
        //           },
        //         ),  (Route<dynamic> route) => false,
        //       );
        //     },
        //   ),
        // ),

        body: ButtonAlertWidget(),
    );
  }
}