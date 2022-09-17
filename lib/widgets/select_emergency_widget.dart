import 'package:boton_panico/widgets/button_select_widget.dart';
import 'package:boton_panico/widgets/sizedboxw_widget.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

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
    
    _getLocation();

    return FutureBuilder(
      future: _loadLocation(),
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
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
                          child: ButtonSelectWidget(tipo: "ROBO", latitud: data['lat'], longitud: data['lon'])
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.32,
                          child: ButtonSelectWidget(tipo: "ACCIDENTE", latitud: data['lat'], longitud: data['lon'])
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.32,
                          child: ButtonSelectWidget(tipo: "INCENDIO", latitud: data['lat'], longitud: data['lon'])
                        ),
                      ],
                    ),
            
                    const SizedBoxWidget(heightSized: 30),
            
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.31,
                              child: ButtonSelectWidget(tipo: "ARMAS", latitud: data['lat'], longitud: data['lon'])
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.31,
                              child: ButtonSelectWidget(tipo: "SUSTANCIAS", latitud: data['lat'], longitud: data['lon'])
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.31,
                              child: ButtonSelectWidget(tipo: "DESLIZAMIENTO", latitud: data['lat'], longitud: data['lon'])
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
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
      }
    );
  }

  Future<void> _getLocation() async {
    
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<Map<String, dynamic>> _loadLocation() async {
    
    Location location = Location();
    LocationData locationData;
    Map<String, dynamic> loc = {};
    
    locationData = await location.getLocation();

    loc['lat'] = locationData.latitude.toString();
    loc['lon'] = locationData.longitude.toString();

    return loc;
  }
}