import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:testlogin/apiclasses/loginusermodel.dart';
import 'package:testlogin/formvalidation/formvalidationmethods.dart';
import 'package:testlogin/reusablewidgets/menu.dart';
import 'package:testlogin/schermate/exitpopup.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    usernameController.addListener(() => setState(() {}));
    //questa funzione rimane in ascolto del mio controller username e vede se ci sono cambiamenti
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  final usernameController = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formkey =
      GlobalKey<FormState>(); //questa key serve per accedere a stato form
  bool passwordobscured = true;
  bool _drawerisopened = false;
  @override
  Widget build(BuildContext context) {
    Login log = Login(
        password: passwordcontroller.text, username: usernameController.text);
    return WillPopScope(
      child: Form(
        //creo il form e li assegno la chiave creata
        key: _formkey,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 52, 156, 225),
                Color.fromARGB(255, 142, 69, 173)
              ])),
          child: Scaffold(
            drawer: Menu(),
            onDrawerChanged: (isopened) => _drawerisopened = isopened,
            //callback chiamata ogni volta che drawer è aperto o chiuso.
            //prende come parametro un booleano. che uso per aggiornare la mia
            //variabile _drawerisopened.
            //se mia variabile è true ritorno a willpopscope un future bool false
            //altrimenti richiamo il dialog per uscire dall' app
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(48),
                ),
              ),
              backgroundColor: Colors.black45,
              title: Text('Login'),
              toolbarHeight: 70,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 80,
                    height: 320,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(25),
                          child: TextFormField(
                            //autovalidateMode:
                            //AutovalidateMode.onUserInteraction,
                            autocorrect: true,
                            validator: (username) {
                              if (username!.isEmpty) {
                                return 'inserisci un username';
                              } else if (username.startsWith(RegExp('[0-9]'))) {
                                return 'il tuo username non può cominciare con dei numeri';
                              } else if (username.contains(' ')) {
                                return 'il campo username non può avere spazi';
                              } else {
                                return null;
                              }
                            },
                            controller: usernameController,
                            textInputAction: TextInputAction.next,
                            //fa venire fuori nella tastiera tasto in basso per continuare o uscire da campo di testo
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black87,
                                ),
                                suffixIcon: usernameController.text
                                        .isEmpty //campo suffix icon dipende da valore input--> se vuoto nessuna icona senno icona X. questo è un cambiamento nel controller
                                    //viene quindi eseguito il setstate che aggiorna la ui.
                                    ? Container(
                                        width: 0,
                                      )
                                    : IconButton(
                                        onPressed: () =>
                                            usernameController.clear(),
                                        icon: Icon(
                                          Icons.close_rounded,
                                          color: Colors.red[700],
                                        )),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  //borderSide: BorderSide(color: Colors.pink) DOVREBBE SERVIRE PER CAMBIARE COLORE BORDO
                                ),
                                labelText: 'Username'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 5, left: 20, right: 20, bottom: 30),
                          child: TextFormField(
                            /*onEditingComplete: () {  FUNZIONA SOLO SE PREMO TASTO SU TASTIERA SENNO NO 
                              if (validateStructure(passwordcontroller.text) ==
                                  false) {
                                Flushbar(
                                  icon: Icon(
                                    Icons.dangerous,
                                    color: Colors.black,
                                  ),
                                  backgroundColor: Colors.redAccent,
                                  message:
                                      'la password deve avere una lettera maiuscola dei numeri un carattere speciale ed essere lunga almeno 8 caratteri',
                                  title:
                                      'la password non rispetta i seguenti requisiti',
                                  duration: Duration(seconds: 4),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  margin: EdgeInsets.all(10),
                                  //flushbarPosition: FlushbarPosition.TOP,
                                ).show(context);
                              } else {}
                            },*/

                            //autovalidateMode: AutovalidateMode
                            //.onUserInteraction, //=> SERVE PER VALIDARE CAMPI QUANDO UTENTE SCRIVE TUTTAVIA DA PROBLEMI CON FLUSHBAR CHE RIMANE LO STESSO
                            //onChanged: (passw) => {setState(() {})},
                            validator: (password) {
                              if (password!.isEmpty) {
                                return 'inserisci una password';
                              } else if (validatepassword(password) == false) {
                                Flushbar(
                                  icon: Icon(
                                    Icons.dangerous,
                                    color: Colors.black,
                                  ),
                                  backgroundColor: Colors.redAccent,
                                  message:
                                      'la password deve avere una lettera maiuscola dei numeri un carattere speciale ed essere lunga almeno 8 caratteri',
                                  title:
                                      'la password non rispetta i seguenti requisiti',
                                  duration: Duration(seconds: 4),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  margin: EdgeInsets.all(10),
                                ).show(context);
                                return '';
                              } else if (password.isNotEmpty) {
                                return null;
                              } else {
                                return null;
                              }
                            },
                            controller: passwordcontroller,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordobscured = !passwordobscured;
                                    });
                                  },
                                  icon: Icon(passwordobscured
                                      ? Icons.visibility_sharp
                                      : Icons.visibility_off),
                                  color: Colors.black87,
                                ),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                labelText: 'Password'),
                            obscureText: passwordobscured,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async => {
                            //log.createuser(log)
                            if (_formkey.currentState!.validate() == false)
                              {}
                            else
                              {
                                await Flushbar(
                                  title: 'Thank you',
                                  message: 'Processing data...',
                                  icon: Icon(
                                    Icons.info,
                                    color: Colors.black,
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.blueAccent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  margin: EdgeInsets.all(10),
                                )
                                    .show(context)
                                    .whenComplete(() => log.createuser(log))
                              },
                          },
                          child: Text('Accedi'),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 52, 156, 225),
                            fixedSize: Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.pushNamed(context, 'Register')
                            }, //aggiungere navigate a pagina register
                            child: Text(
                              'Nuovo Utente?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 52, 156, 225),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () {
        if (_drawerisopened == true) {
          return Future.value(false);
        } else {
          return showExitPopup(context);
        }
      },
    );
  }
}
