import 'package:flutter/material.dart';
import 'package:testlogin/schermate/Registerstateful.dart';
import 'package:testlogin/schermate/editgestioneprofilo.dart';
import 'package:testlogin/schermate/gestioneprofilo.dart';
import 'package:testlogin/schermate/LoginPage.dart';

import 'model/userdata.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Userdata.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Authflutter',
      routes: {
        'Register': (context) => Registerstatteful(),
        'gestioneprofilo': (context) => Gestionprofilo(),
        'testgradient': (context) => LoginPage(),
        'editgestioneprofilo': (context) => Editgestioneprofilo()
      },
      //theme: ThemeData(),
      home: LoginPage(),
      initialRoute: '/',
    );
  }
}
