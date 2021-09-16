import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:testlogin/apiclasses/loginusermodel.dart';
import 'package:testlogin/formvalidation/formvalidationmethods.dart';
import 'package:testlogin/reusablewidgets/Textfieldregister.dart';

class Registerstatteful extends StatefulWidget {
  const Registerstatteful({Key? key}) : super(key: key);

  @override
  _RegisterstattefulState createState() => _RegisterstattefulState();
}

class _RegisterstattefulState extends State<Registerstatteful> {
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  @override
  void initState() {
    //usernamecontroller.addListener(() => setState(() {}));
    //emailcontroller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    Register reg = Register(
        username: usernamecontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text,
        confirmpassword: confirmpasswordcontroller.text);
    return Scaffold(
      backgroundColor: Colors.white,
      //# region Bottomnavbar
      /*bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,

              ),
              label: 'Impostazioni')
        ]
      ),*/
      //# end region

      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(48),
          ),
        ),
        toolbarHeight: 70,
        title: Text(
          'Registrati',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color.fromARGB(255, 52, 156, 225),
        leading: IconButton(
            onPressed: () => {Navigator.pop(context, '/')},
            icon: Icon(Icons.arrow_back)),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Expanded(
              // wrappare expanded è fondamentale, senza non ho lo scrolling della pagina
              child: SingleChildScrollView(
                //primary: true,
                padding:
                    EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Textfieldregister(
                      labeltext: 'Username',
                      prefixicon: Icon(Icons.person),
                      textEditingController: usernamecontroller,
                      textInputAction: TextInputAction.next,
                      suffixicon: //usernamecontroller.text.isEmpty
                          //? Container(
                          // width: 0,
                          //)
                          //:
                          IconButton(
                        onPressed: () => (usernamecontroller.clear()),
                        icon: Icon(Icons.close),
                      ),
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
                      height: 60,
                    ),
                    Textfieldregister(
                      labeltext: 'E-mail',
                      prefixicon: Icon(Icons.email),
                      textInputType: TextInputType.emailAddress,
                      textEditingController: emailcontroller,
                      textInputAction: TextInputAction.next,
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
                      height: 60,
                    ),
                    Textfieldregister(
                      labeltext: 'Password',
                      prefixicon: Icon(Icons.lock),
                      obscuretext: true,
                      textInputAction: TextInputAction.next,
                      textEditingController: passwordcontroller,
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'inserisci una password';
                        } else if (password.contains(' ')) {
                          return 'la password non può contenere spazi';
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
                            //flushbarPosition: FlushbarPosition.TOP,
                          ).show(context);
                          return '';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Textfieldregister(
                      labeltext: 'Confirm password',
                      prefixicon: Icon(Icons.lock),
                      obscuretext: true,
                      textInputAction: TextInputAction.done,
                      textEditingController: confirmpasswordcontroller,
                      validator: (confirmpassword) {
                        if (confirmpassword!.isEmpty) {
                          return 'inserisci conferma password';
                        } else if (confirmpassword.contains(' ')) {
                          return 'la password non può contenere spazi';
                        } else if (validatepassword(confirmpassword) == false) {
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
                          return '';
                        } else if (passwordmatch(
                                passwordcontroller.text, confirmpassword) ==
                            false) {
                          return 'le due password non corrispondono';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    ElevatedButton(
                      onPressed: () async => {
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
                            ).show(context).whenComplete(
                                  () => reg.registeruser(reg),
                                ),
                          },
                      },
                      child: Text('Registrati'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(160, 60),
                        primary: Color.fromARGB(255, 52, 156, 225),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
