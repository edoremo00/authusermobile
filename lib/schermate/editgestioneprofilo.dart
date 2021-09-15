import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testlogin/model/user.dart';
import 'package:testlogin/model/userdata.dart';
import 'package:testlogin/reusablewidgets/appbar.dart';
import 'package:testlogin/reusablewidgets/editprofiletextwidget.dart';
import 'package:testlogin/schermate/Registerstateful.dart';
import 'package:testlogin/schermate/profilewidget.dart';
import 'package:path/path.dart';

class Editgestioneprofilo extends StatefulWidget {
  const Editgestioneprofilo({Key? key}) : super(key: key);

  @override
  _EditgestioneprofiloState createState() => _EditgestioneprofiloState();
}

class _EditgestioneprofiloState extends State<Editgestioneprofilo> {
  User u = Userdata.getUser();
  late GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late TextEditingController usernamecontroller;
  late TextEditingController surnamecontroller;
  late TextEditingController emailcontroller;
  late TextEditingController aboutcontroller;

  @override
  void initState() {
    super.initState();
    usernamecontroller = TextEditingController(text: u.name);
    surnamecontroller = TextEditingController(text: u.surname);
    emailcontroller = TextEditingController(text: u.email);
    aboutcontroller = TextEditingController(text: u.about);
    _formkey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    surnamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Reusableappbar(
        appbarheigth: 70,
        backgroundcolor: Color.fromARGB(255, 52, 156, 225),
        leadingwidget: BackButton(),
      ),
      body: Form(
        key: _formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: u.imagePath,
              onclick: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image == null) return;
                final directorysalvafoto =
                    await getApplicationDocumentsDirectory();
                final imagenamefile = basename(image.path);
                final imagefile =
                    File('${directorysalvafoto.path}/$imagenamefile');
                final nuovaimmagine =
                    await File(image.path).copy(imagefile.path);
                setState(() {
                  u.copy(imagePath: nuovaimmagine.path);
                });
              },
              imageheight: 128,
              imagewidth: 128,
              isedit: true,
            ),
            SizedBox(height: 24),
            Editprofiletextwidget(
              label: 'Username',
              text: u.name,
              onchanged: (name) => u = u.copy(
                  name:
                      name), //metodo copy sovrascrive oggetto user se ci sono cambiamenti. altrimenti usa valori oggetto esistente
              controller: usernamecontroller,
              validator: (username) {
                if (username!.isEmpty) {
                  return 'inserisci un username';
                } else if (username.startsWith(RegExp(r'[0-9]'))) {
                  return 'username non può iniziare con dei numeri';
                } else if (username.contains(' ')) {
                  return 'username non può contenere spazi';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 24,
            ),
            Editprofiletextwidget(
              label: 'Surname',
              text: u.surname,
              onchanged: (surname) => u = u.copy(surname: surname),
              controller: surnamecontroller,
              validator: (surname) {
                if (surname!.isEmpty) {
                  return 'inserisci un cognome';
                } else if (surname.startsWith(RegExp(r'[0-9]'))) {
                  return 'il cognome non può iniziare con dei numeri';
                } else if (surname.contains(' ')) {
                  return 'cognome non può contenere spazi';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 24,
            ),
            Editprofiletextwidget(
              label: 'email',
              text: u.email,
              onchanged: (email) => u = u.copy(email: email),
              controller: emailcontroller,
              validator: (email) {
                if (email!.isEmpty) {
                  return 'inserisci una mail';
                } else if (validateemail(email) == false) {
                  return 'inserisci una mail valida';
                } else if (email.isEmpty) {
                  return 'il campo mail non può essere vuoto';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 24,
            ),
            Editprofiletextwidget(
              label: 'About',
              text: u.about,
              onchanged: (about) => u = u.copy(about: about),
              controller: aboutcontroller,
              maxlines: 5,
              validator: (about) {
                if (about!.isEmpty) {
                  return 'campo about non può essere vuoto';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton.icon(
              onPressed: () {
                if (_formkey.currentState!.validate() == false) {
                  //se form non è valido non sovrascrivo oggetto
                } else {
                  Userdata.setUser(u);
                }
              }, //u.name = usernamecontroller.text => PER MODIFICARE CAMPI UTENTE, BISOGNA TOGLIERE TUTTI I CAMPI FINAL PER FARLO FUNZIONARE. INOLTRE DATI NON SI AGGIORNANO SUBITO
              icon: Icon(Icons.save),
              label: Text('Salva'),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 52, 156, 225),
                  fixedSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.all(10)),
            )
          ],
        ),
      ),
    );
  }
}
