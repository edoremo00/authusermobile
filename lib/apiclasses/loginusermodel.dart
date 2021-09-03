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
      Uri.parse('http://10.0.2.2:44322/api/Auth'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      //return Login.fromJson(jsonDecode(response.body));
      print(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to log-in user.');
    }
  }
}
