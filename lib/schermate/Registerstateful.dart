import 'package:flutter/material.dart';
import 'package:testlogin/apiclasses/loginusermodel.dart';
import 'package:testlogin/reusablewidgets/Textfieldregister.dart';

class Registerstatteful extends StatefulWidget {
  const Registerstatteful({Key? key}) : super(key: key);

  @override
  _RegisterstattefulState createState() => _RegisterstattefulState();
}

class _RegisterstattefulState extends State<Registerstatteful> {
  int selectedindex = 0;
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Register reg = Register(
        username: usernamecontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text,
        confirmpassword: confirmpasswordcontroller.text);
    return Scaffold(
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
          'Registrati qui',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.pink[400],
        leading: IconButton(
            onPressed: () => {Navigator.pop(context, '/')},
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
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
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () => {reg.registeruser(reg)},
                    child: Text('Registrati'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(160, 60),
                      primary: Colors.pink[400],
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
    );
  }
}
