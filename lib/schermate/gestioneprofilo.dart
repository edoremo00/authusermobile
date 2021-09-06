import 'package:flutter/material.dart';
import 'package:testlogin/reusablewidgets/menu.dart';

class Gestionprofilo extends StatefulWidget {
  Gestionprofilo({Key? key}) : super(key: key);

  @override
  _GestionprofiloState createState() => _GestionprofiloState();
}

class _GestionprofiloState extends State<Gestionprofilo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
    );
  }
}
