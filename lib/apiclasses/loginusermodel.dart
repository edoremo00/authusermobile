import 'dart:convert';
import 'package:http/http.dart' as http;

class Login {
  final String username;
  final String password;

  Login({required this.password, required this.username});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      username: json['username'],
      password: json['password'],
    );
  }

  void createuser(Login log) async {
    final response = await http.post(
      Uri.parse(
          'https://authflutterapi.azurewebsites.net/api/Auth/login'), //127.0.0.1:  https://localhost:44322/api/Auth/login--> usa questo se esegui app da browser
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*'
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      //return Login.fromJson(jsonDecode(response.body));
      print(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.reasonPhrase);
      throw Exception('Failed to log-in user.');
    }
  }
}
