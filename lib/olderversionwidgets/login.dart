import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            labelText: 'Username'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: TextField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () =>
                                    print('cliccato mostra password'),
                                icon: Icon(Icons.visibility)),
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            labelText: 'Password'),
                        obscureText: true,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => 'click',
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink[400],
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () => print(
                            'cliccato'), //aggiungere navigate a pagina register
                        child: Text(
                          'Gia registrato?',
                          style: TextStyle(color: Colors.blue[700]),
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
