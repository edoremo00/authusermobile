import 'package:flutter/material.dart';
import 'package:testlogin/apiclasses/loginusermodel.dart';
import 'package:testlogin/reusablewidgets/menu.dart';
import 'package:testlogin/schermate/exitpopup.dart';
import 'package:testlogin/schermate/gestioneprofilo.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool passwordobscured = true;
  final usernameController = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    usernameController.addListener(() => setState(() {}));
    //questa funzione rimane in ascolto del mio controller username e vede se ci sono cambiamenti
  }

  //String testousername=usernameController.text.toString(); farlo nel metodo initstate. ancora non è stato instanziato quindi non è possibile accedervi
  @override
  Widget build(BuildContext context) {
    Login log = Login(
        password: passwordcontroller.text, username: usernameController.text);
    return MaterialApp(
      routes: {
        'gestioneprofilo': (context) => Gestionprofilo()
      }, //fare pagina register e usare navigator nell'on tap del gesture detector
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: WillPopScope(
        child: Scaffold(
          drawer: Menu(),
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(48),
              ),
            ),
            toolbarHeight: 70,
            backgroundColor: Colors.pink[400],
          ),
          resizeToAvoidBottomInset: true,
          body: Container(
            margin: EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(top: Radius.elliptical(30, 30)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 52, 156, 225),
                    Color.fromARGB(255, 142, 69, 173)
                  ],
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 80,
                  height: 340,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: TextField(
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
                        child: TextField(
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
                        onPressed: () => {log.createuser(log)},
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink[400],
                            fixedSize: Size(200, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            padding: EdgeInsets.all(10)),
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
                                color: Colors.blue[700],
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () => showExitPopup(context),
      ),
    );
  }
}
