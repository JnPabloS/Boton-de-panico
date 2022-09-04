import 'package:http/http.dart' as http;

class IngresoServices {

  final ip = "http://sistemic.udea.edu.co:4000";

  Future login(String usuario, String password) async {
    var headers = {
      'Authorization': 'Basic Zmx1dHRlci1yZXRvOnVkZWE=',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse('$ip/reto/autenticacion/oauth/token'));
    request.bodyFields = {
      'username': usuario,
      'password': password,
      'grant_type': 'password'
    };
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