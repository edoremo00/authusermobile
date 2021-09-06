import 'package:flutter/material.dart';
import 'package:testlogin/schermate/Loginstateful.dart';
import 'package:testlogin/schermate/Registerstateful.dart';
import 'package:testlogin/schermate/gestioneprofilo.dart';

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
        '/': (context) => Loginscreen(),
        'gestioneprofilo': (context) => Gestionprofilo()
      },
      //theme: ThemeData(),
      //home: Loginscreen(),
      initialRoute: '/',
    );
  }
}
