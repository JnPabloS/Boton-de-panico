import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';




class IngresoServices {

  final ip = "http://sistemic.udea.edu.co:4000";
  
  Future<bool> login(String user, String password) async {
    
    var headers = {
      'Authorization': 'Basic Zmx1dHRlci1yZXRvOnVkZWE=',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse('$ip/reto/autenticacion/oauth/token'));
    request.bodyFields = {
      'username'  : user,
      'password'  : password,
      'grant_type': 'password'
    };
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
          return true;
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
        return false;
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
      return false;
    }
  }

    Future register(String user, String email, String password) async {
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

    Future otp(String code, String user) async {
      var request = http.MultipartRequest('POST', Uri.parse('$ip/reto/usuarios/registro/confirmar/$user'));
      request.fields.addAll({
        'codigo': code
      });


      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }
    }

    Future addContacts(String name, String lastName, String email, String cell, String user) async {
      var headers = {
        'Content-Type'  : 'application/json'
      };
      var request = http.Request('POST', Uri.parse('$ip/reto/usuarios/contactos/crear/$user'));
      request.body = json.encode({
        "name"     : name,
        "lastName" : lastName,
        "email"    : email,
        "cellPhone": cell
      });
      request.headers.addAll(headers);
      try {
      http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
          print("INSCRITOOOOO");
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
        return false;
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
      return false;
    }
  }

  Future seeProfile() async {
    var request = http.Request('GET', Uri.parse('$ip/reto/usuarios/usuarios/encontrar/julianoo'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Fluttertoast.showToast(
          msg: "ENTRE",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else {
      print(response.reasonPhrase);
      Fluttertoast.showToast(
          msg: "NADA",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }


}