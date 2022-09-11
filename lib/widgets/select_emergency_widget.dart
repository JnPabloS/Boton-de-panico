import 'package:boton_panico/widgets/button_select_widget.dart';
import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:flutter/material.dart';

// class SizeConfig {
//  static late MediaQueryData _mediaQueryData;
//  static late double screenWidth;
//  static late double screenHeight ;
//  static late double blockSizeHorizontal;
//  static late double blockSizeVertical;
 
//  void init(BuildContext context) {
//   _mediaQueryData = MediaQuery.of(context);
//   screenWidth = _mediaQueryData.size.width;
//   screenHeight = _mediaQueryData.size.height;
//   blockSizeHorizontal = screenWidth / 100;
//   blockSizeVertical = screenHeight / 100;
//  }
// }


class SelectEmeregencyWidget extends StatelessWidget {
  const SelectEmeregencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              
              const SizedBoxWidget(heightSized: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.32,
                    child: ButtonSelectWidget(tipo: "ROBO",)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.32,child: ButtonSelectWidget(tipo: "ACCIDENTE",)),
                  SizedBox(width: MediaQuery.of(context).size.width*0.32,child: ButtonSelectWidget(tipo: "INCENDIO",)),
                ],
              ),
      
              const SizedBoxWidget(heightSized: 30),
      
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.31,child: ButtonSelectWidget(tipo: "ARMAS",)),
                      SizedBox(width: MediaQuery.of(context).size.width*0.31,child: ButtonSelectWidget(tipo: "SUSTANCIAS",)),
                      SizedBox(width: MediaQuery.of(context).size.width*0.31,child: ButtonSelectWidget(tipo: "DESLIZAMIENTO",)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}