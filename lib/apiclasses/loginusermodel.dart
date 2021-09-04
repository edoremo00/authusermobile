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

  Future<Login> createuser(Login log) async {
    final response = await http.post(
      Uri.parse(
          'https://localhost:44322/api/Auth/login'), //https://10.0.2.2:44322/api/Auth/login //127.0.0.1:  https://localhost:44322/api/Auth/login--> usa questo se esegui app da browser //https://authflutterapi.azurewebsites.net/api/Auth/login
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Login.fromJson(jsonDecode(response.body));
      //print(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.reasonPhrase);
      throw Exception('Failed to log-in user.');
    }
  }
}

class Register {
  final String username;
  final String email;
  final String password;
  final String confirmpassword;

  Register(
      {required this.username,
      required this.email,
      required this.password,
      required this.confirmpassword});

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
        username: json['username'],
        email: json['email'],
        password: json['password'],
        confirmpassword: json['confirmpassword']);
  }

  Future<dynamic> registeruser(Register nuovo) async {
    final response = await http.post(
      Uri.parse('https://localhost:44322/api/Auth'),
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
        'confirmpassword': confirmpassword
      }),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Register.fromJson(jsonDecode(response.body));
      //print(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.reasonPhrase);
      throw Exception('Failed to registeruser');
    }
  }
}
