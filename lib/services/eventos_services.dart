import 'package:boton_panico/user_preferences/user_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventosServices {

  final ip = "http://sistemic.udea.edu.co:4000";
  final prefs = PreferenciasUsuario();

  Future crearEvento(String lat, String lon, String descripcion, String comentario) async {
    var headers = {
    'Authorization': 'Bearer ${prefs.refreshToken}',
    'Content-Type': 'application/json',
    'Cookie': 'color=rojo'
    };
    var request = http.Request('POST', Uri.parse('$ip/reto/events/eventos/crear/usuario/${prefs.username}'));
    request.body = json.encode({
      "location": [
        lat,
        lon
      ],
      "eventDescription": descripcion,
      "comment": comentario
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print(response.statusCode);

    if (response.statusCode == 201) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
}