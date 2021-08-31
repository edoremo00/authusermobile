import 'package:flutter/material.dart';
import 'package:testlogin/schermate/Loginstateful.dart';
import 'package:testlogin/schermate/Registerstateful.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        'Register': (context) => Registerstatteful(),
        '/': (context) => Loginscreen()
      },
      //theme: ThemeData(),
      //home: Loginscreen(),
      initialRoute: '/',
    );
  }
}
