import 'package:flutter/material.dart';
import 'package:testlogin/reusablewidgets/menu.dart';
import 'package:testlogin/reusablewidgets/menureusable.dart';

class Gestionprofilo extends StatefulWidget {
  Gestionprofilo({Key? key}) : super(key: key);

  @override
  _GestionprofiloState createState() => _GestionprofiloState();
}

class _GestionprofiloState extends State<Gestionprofilo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(48),
          ),
        ),
        backgroundColor: Colors.pink[400],
        toolbarHeight: 70,
      ),
      drawer: Drawer(
        child: Material(
          color: Colors.pink[200],
          child: ListView(
            children: [
              SizedBox(
                height: 48,
              ),
              Reusablemenu(
                titolo: 'Home',
                coloreicona: Colors.black87,
                coloretesto: Colors.black87,
                funzioneontap: () => {},
                grandezzatesto: 14,
                iconaleading: Icons.home,
                spessoretesto: FontWeight.bold,
              ),
              SizedBox(
                height: 48,
              ),
              Reusablemenu(
                titolo: 'Esci',
                coloreicona: Colors.black87,
                coloretesto: Colors.black87,
                funzioneontap: () => {},
                grandezzatesto: 14,
                iconaleading: Icons.logout_rounded,
                spessoretesto: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
