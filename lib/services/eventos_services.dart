import 'package:http/http.dart' as http;
import 'dart:convert';

class EventosServices {

  final ip = "http://sistemic.udea.edu.co:4000";

  Future crearEvento(String user, String token, String lat, String lon, String descripcion) async {
    var headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
    'Cookie': 'color=rojo'
    };
    var request = http.Request('POST', Uri.parse('$ip/reto/events/eventos/crear/usuario/$user'));
    request.body = json.encode({
      "location": [
        lat,
        lon
      ],
      "eventDescription": descripcion,
      "comment": ""
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