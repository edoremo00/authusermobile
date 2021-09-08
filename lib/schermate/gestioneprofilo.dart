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
      backgroundColor: Colors.white,
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
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Material(
            child: SizedBox(
              height: 28,
            ),
          ),
          Column(
            children: [
              ListTile(
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.black87,
                  splashRadius: 15,
                  onPressed: () => {},
                ),
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                //tileColor: Colors.yellow,
                title: Text('Edoardo'),
              ),
              SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff94d500),
                    child: IconButton(
                      tooltip: 'Upload',
                      icon: Icon(
                        Icons.upload,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                    child: IconButton(
                      tooltip: 'Delete',
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
