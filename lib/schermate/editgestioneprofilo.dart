import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testlogin/formvalidation/formvalidationmethods.dart';
import 'package:testlogin/model/user.dart';
import 'package:testlogin/model/userdata.dart';
import 'package:testlogin/reusablewidgets/appbar.dart';
import 'package:testlogin/reusablewidgets/editprofiletextwidget.dart';
import 'package:testlogin/schermate/profilewidget.dart';
import 'package:path/path.dart';

class Editgestioneprofilo extends StatefulWidget {
  const Editgestioneprofilo({Key? key}) : super(key: key);

  @override
  _EditgestioneprofiloState createState() => _EditgestioneprofiloState();
}

class _EditgestioneprofiloState extends State<Editgestioneprofilo> {
  User u = Userdata.getUser();
  User defaultuser = Userdata.utente;
  //late bool isbuttondisabled;
  //User hardcoded = Userdata.utente;
  late bool isbuttonvisible;
  late GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late TextEditingController usernamecontroller;
  late TextEditingController surnamecontroller;
  late TextEditingController emailcontroller;
  late TextEditingController aboutcontroller;
  final _snackBar = SnackBar(content: Text('Profilo aggiornato con successo'));
  late bool isloading;
  late bool cameraselected;
  late bool didntchoseoption;
  late bool savebuttonenabled;

  @override
  void initState() {
    super.initState();
    Userdata.getUser();
    usernamecontroller = TextEditingController(text: u.name);
    surnamecontroller = TextEditingController(text: u.surname);
    emailcontroller = TextEditingController(text: u.email);
    aboutcontroller = TextEditingController(text: u.about);

    _formkey = GlobalKey<FormState>();
    isloading = false;
    cameraselected = false;
    didntchoseoption = true;
    savebuttonenabled = false;
    //per evitare problema in cui utente chiude dialog senza fare nulla

    /*usernamecontroller.addListener(() {
      setState(() {
        if (usernamecontroller.value.text.toLowerCase().trim() !=
            u.name.toLowerCase().trim())
          savebuttonenabled = true;
        else
          savebuttonenabled = false;
      });
    });*/
    /*surnamecontroller.addListener(() {
      setState(() {
        if (surnamecontroller.value.text.toLowerCase().trim() !=
            u.surname.toLowerCase().trim())
          savebuttonenabled = true;
        else
          savebuttonenabled = false;
      });
    });
    emailcontroller.addListener(() {
      setState(() {
        if (emailcontroller.value.text.toLowerCase().trim() !=
            u.email.toLowerCase().trim())
          savebuttonenabled = true;
        else
          savebuttonenabled = false;
      });
    });
    aboutcontroller.addListener(() {
      setState(() {
        if (aboutcontroller.value.text.toLowerCase().trim() !=
            u.about.toLowerCase().trim()) {
          savebuttonenabled = true;
        } else {
          savebuttonenabled = false;
        }
      });
    });*/
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    surnamecontroller.dispose();
    emailcontroller.dispose();
    aboutcontroller.dispose();
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
                didntchoseoption = true;
                await selectpicturemessage(context);
                if (didntchoseoption == true)
                  return; //problema se utente chiude dialog ritorna null
                final image = await ImagePicker().pickImage(
                    source: cameraselected
                        ? ImageSource.camera
                        : ImageSource.gallery);
                //prendo immagine da file e la salvo in variabile
                if (image == null) return; //se non scelgo immagine esco;
                final directorysalvafoto =
                    await getApplicationDocumentsDirectory(); //questo metodo restituisce directory che usa applicazione per salvare dati
                final imagenamefile = basename(image
                    .path); // con basename ottengo solo nome file immagine scelta
                final imagefile = // questo sarà il path completo della nuova immagine. dato da directory + basename
                    File('${directorysalvafoto.path}/$imagenamefile');
                final nuovaimmagine =
                    await File(image.path).copy(imagefile.path);
                //creo un file con path immagine e lo copio nella cartella
                //aggiorno UI PER MOSTRARE FOTO
                setState(
                  () => u = u.copy(imagePath: nuovaimmagine.path),
                );
                await Userdata.setUser(
                  u.copy(imagePath: nuovaimmagine.path),
                ); //SALVO NUOVA FOTO IN SHPREFERENCES
              },
              imageheight: 128,
              imagewidth: 128,
              isedit: true,
            ),
            SizedBox(height: 24),
            Editprofiletextwidget(
              label: 'Username',
              text: u.name,
              //onchanged: (name) => u = u.copy(
              onchanged: (name) => setState(() {
                if (usernamecontroller.value.text.toLowerCase().trim() !=
                    u.name.toLowerCase().trim())
                  savebuttonenabled = true;
                else
                  savebuttonenabled = false;
              }),
              //name:
              // name), //metodo copy sovrascrive oggetto user se ci sono cambiamenti. altrimenti usa valori oggetto esistente
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
              onchanged: (surname) => setState(() {
                if (surnamecontroller.value.text.toLowerCase().trim() !=
                    u.surname.toLowerCase().trim())
                  savebuttonenabled = true;
                else
                  savebuttonenabled = false;
              }),
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
              onchanged: (email) => setState(() {
                if (emailcontroller.value.text.toLowerCase().trim() !=
                    u.email.toLowerCase().trim())
                  savebuttonenabled = true;
                else
                  savebuttonenabled = false;
              }),
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
              onchanged: (about) => setState(() {
                if (aboutcontroller.value.text.toLowerCase().trim() !=
                    u.about.toLowerCase().trim())
                  savebuttonenabled = true;
                else
                  savebuttonenabled = false;
              }),
              text: u.about,
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
              onPressed: savebuttonenabled && _formkey.currentState!.validate()
                  ? () async {
                      //AGGIUSTARE METODO useralredyinsharedpreferences()
                      if (_formkey.currentState!.validate() == false) {
                        //se form non è valido non sovrascrivo oggetto
                      } else {
                        setState(() {
                          isloading = !isloading;
                        });
                        await Future.delayed(Duration(seconds: 3)).whenComplete(
                          () => setState(
                            () {
                              isloading = false;
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                        await Userdata.setUser(
                          u.copy(
                              about: aboutcontroller.value.text,
                              email: emailcontroller.value.text,
                              name: usernamecontroller.value.text,
                              surname: surnamecontroller.value.text),
                        );
                      }
                    }
                  : null, //u.name = usernamecontroller.text => PER MODIFICARE CAMPI UTENTE, BISOGNA TOGLIERE TUTTI I CAMPI FINAL PER FARLO FUNZIONARE. INOLTRE DATI NON SI AGGIORNANO SUBITO
              icon: isloading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white,
                        ),
                      ],
                    )
                  : Icon(Icons.save), //Icon(Icons.save),
              label: isloading ? Text('Attendere prego') : Text('Salva'),
              style: ElevatedButton.styleFrom(
                  onSurface: Colors.blue,
                  primary: isloading
                      ? Color.fromARGB(255, 0, 187, 255)
                      : Color.fromARGB(255, 52, 156, 225),
                  fixedSize: Size(200, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.all(10)),
            ),
          ],
        ),
      ),
    );
  }

//METODO MALFUNZIONANTE PER SETTARE CALLBACK BOTTONE A NULL
  onsavedclicked() {
    if (_formkey.currentState!.validate() == false) {
      setState(() {
        //isbuttondisabled = true;
        return null; // how to make onpressed  callback null? in order to disable the button?
      });
    } else {
      //ScaffoldMessenger.of(context as BuildContext)
      //.showSnackBar(_snackBar);
      return Userdata.setUser(u);
    }
  }

  Future<bool> useralredyinsharedpreferences() async {
    //a volte funziona altre ti dice che c' è un oggetto salvato che è uguale anche se non è così. problema penso sia il contains. se metto
    //lettera non presente nel mio nome allora salva altrimenti no. profare altri metodi
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user')!.contains(usernamecontroller.text) &&
        prefs.getString('user')!.contains(surnamecontroller.text) &&
        prefs.getString('user')!.contains(emailcontroller.text) &&
        prefs.getString('user')!.contains(u.imagePath)) {
      print('già presente');
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<void> selectpicturemessage(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue, width: 1),
                      ),
                      onPressed: () {
                        cameraselected = false;
                        didntchoseoption = false;
                        Navigator.pop(context, true); //per chiudere dialog
                      },
                      icon: Icon(
                        Icons.photo_size_select_actual_outlined,
                        color: Colors.blue[400],
                      ),
                      label: Text(
                        'Gallery',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue, width: 1),
                      ),
                      onPressed: () {
                        cameraselected = true;
                        didntchoseoption = false;
                        Navigator.pop(context, true);
                      },
                      icon: Icon(
                        Icons.camera,
                        color: Colors.blue[400],
                      ),
                      label: Text(
                        "Camera",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
