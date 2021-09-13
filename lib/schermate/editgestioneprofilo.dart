import 'package:flutter/material.dart';
import 'package:testlogin/model/user.dart';
import 'package:testlogin/model/userdata.dart';
import 'package:testlogin/reusablewidgets/appbar.dart';
import 'package:testlogin/reusablewidgets/editprofiletextwidget.dart';
import 'package:testlogin/schermate/profilewidget.dart';

class Editgestioneprofilo extends StatefulWidget {
  const Editgestioneprofilo({Key? key}) : super(key: key);

  @override
  _EditgestioneprofiloState createState() => _EditgestioneprofiloState();
}

class _EditgestioneprofiloState extends State<Editgestioneprofilo> {
  User u = Userdata.utente;
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: u.imagePath,
            onclick: () async {},
            imageheight: 128,
            imagewidth: 128,
            isedit: true,
          ),
          SizedBox(height: 24),
          Editprofiletextwidget(
            label: 'Username',
            text: u.name,
            onchanged: (name) {},
            controller: usernamecontroller,
          ),
          SizedBox(
            height: 24,
          ),
          Editprofiletextwidget(
            label: 'Surname',
            text: u.surname,
            onchanged: (surname) {},
            controller: surnamecontroller,
          ),
          SizedBox(
            height: 24,
          ),
          Editprofiletextwidget(
              label: 'email',
              text: u.email,
              onchanged: (email) {},
              controller: emailcontroller),
          SizedBox(
            height: 24,
          ),
          Editprofiletextwidget(
            label: 'About',
            text: u.about,
            onchanged: (about) {},
            controller: aboutcontroller,
            maxlines: 5,
          ),
          SizedBox(
            height: 24,
          ),
          ElevatedButton.icon(
            onPressed: () => {},
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
    );
  }
}
