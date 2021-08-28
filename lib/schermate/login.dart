import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //return material app or scaffold? cosa cambia
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
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
                height: 200,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        labelText: 'Username'),
                    cursorColor: Colors.black87,
                  ),
                ),
                /*child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Username',
                  ),
                ),*/
              ),
            ],
          ),
        ),
      ),
    );
  }
}
