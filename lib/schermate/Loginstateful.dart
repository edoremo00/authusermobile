import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool passwordobscured = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {}, //fare pagina register e usare navigator nell'on tap del gesture detector
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ciao!'),
          centerTitle: true,
          backgroundColor: Colors.pink[400],
        ),
        body: Container(
          decoration: BoxDecoration(
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
                height: 300,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
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
                      padding: EdgeInsets.all(25),
                      child: TextField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordobscured = !passwordobscured;
                                  });
                                },
                                icon: Icon(passwordobscured
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
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
                      onPressed: () => print('click'),
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink[400],
                          fixedSize: Size(100, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          padding: EdgeInsets.all(10)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, 'Register')
                        }, //aggiungere navigate a pagina register
                        child: Text(
                          'Gia registrato?',
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
    );
  }
}
