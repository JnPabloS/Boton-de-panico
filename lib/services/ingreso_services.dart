import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class IngresoServices {

  final ip = "http://sistemic.udea.edu.co:4000";

  Future login(String user, String password) async {
    var headers = {
      'Authorization': 'Basic Zmx1dHRlci1yZXRvOnVkZWE=',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse('$ip/reto/autenticacion/oauth/token'));
    request.bodyFields = {
      'username': user,
      'password': password,
      'grant_type': 'password'
    };
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
       }
       else {
        print(response.reasonPhrase);
        Fluttertoast.showToast(
          msg: "Credenciales incorrectas",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 16.0
        );
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "Problemas con el servidor",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

    Future<dynamic> register(String user, String email, String password) async {
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('$ip/reto/usuarios/registro/enviar'));
      request.body = json.encode({
        "username": user,
        "password": password,
        "email": email
      });
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