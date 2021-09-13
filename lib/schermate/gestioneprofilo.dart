import 'package:flutter/material.dart';
import 'package:testlogin/model/user.dart';
import 'package:testlogin/model/userdata.dart';
import 'package:testlogin/reusablewidgets/menureusable.dart';
import 'package:testlogin/schermate/profilewidget.dart';

class Gestionprofilo extends StatefulWidget {
  Gestionprofilo({Key? key}) : super(key: key);

  @override
  _GestionprofiloState createState() => _GestionprofiloState();
}

class _GestionprofiloState extends State<Gestionprofilo> {
  @override
  Widget build(BuildContext context) {
    final infoutente = Userdata.utente;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(48),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 52, 156, 225),
        toolbarHeight: 70,
        leading: BackButton(), //è un iconbutton con navigator.pop
      ),
      /*endDrawer: Drawer(
        elevation: 0,
        child: Material(
          color: Colors.pink[200],
          child: ListView(
            children: [
              SizedBox(
                height: 48,
              ),
              Reusablemenu(
                titolo: 'Home',
                coloreicona: Colors.white,
                coloretesto: Colors.white,
                funzioneontap: () =>
                    {Navigator.popUntil(context, ModalRoute.withName('/'))},
                grandezzatesto: 14,
                iconaleading: Icons.home,
                spessoretesto: FontWeight.bold,
              ),
              SizedBox(
                height: 48,
              ),
              Reusablemenu(
                titolo: 'Esci',
                coloreicona: Colors.white,
                coloretesto: Colors.white,
                funzioneontap: () => {},
                grandezzatesto: 14,
                iconaleading: Icons.logout_rounded,
                spessoretesto: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),*/
      body: ListView(
        padding: EdgeInsets.only(top: 40),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: infoutente.imagePath,
            imageheight: 128,
            imagewidth: 128,
            onclick: () => {},
          ),
          SizedBox(
            height: 24,
          ),
          buildname(infoutente),
          SizedBox(
            height: 24,
          ),
          buildabout(infoutente),
        ],
      ),
    );
  }

  Widget buildname(User u) {
    return Column(
      children: [
        Text(
          u.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text(
          u.surname,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          u.email,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget buildabout(User infoutente) {
    return Column(
      children: [
        Text(
          'About',
          style:
              TextStyle(fontSize: 24, height: 1.4, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          infoutente.about,
          style: TextStyle(color: Colors.black87),
          softWrap: true,
        ),
      ],
    );
  }

  Widget buildsurname(User infoutente) {
    return Row(
      children: [Text(infoutente.surname)],
    );
  }
}
