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

  Future attachFiles(String image, String audio) async {

    print(image);
    var headers = {
      'Authorization': 'Bearer ${prefs.refreshToken}',
      'Cookie': 'color=rojo'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$ip/reto/events/files/anexar/usuarios/${prefs.username}'));

    if(image == "" || audio == "") {
      if(image == "" && audio != ""){
        request.files.add(await http.MultipartFile.fromPath('audios', audio));
      } else if (image != "" && audio == "") {
        request.files.add(await http.MultipartFile.fromPath('imagenes', image));
      } else {
        print("Vacios");
      }
    } else {
      request.files.add(await http.MultipartFile.fromPath('imagenes', image));
      request.files.add(await http.MultipartFile.fromPath('audios', audio));
    }

    // request.files.add(await http.MultipartFile.fromPath('imagenes', image));
    // request.files.add(await http.MultipartFile.fromPath('videos', audio));
    // request.files.add(await http.MultipartFile.fromPath('audios', audio));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response);

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }

  Future getFiles(String id) async {
    var headers = {
      'Authorization': 'Bearer ${prefs.refreshToken}',
      'Cookie': 'color=rojo'
    };
    var request = http.Request('GET', Uri.parse('$ip/reto/events/files/obtener/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
}