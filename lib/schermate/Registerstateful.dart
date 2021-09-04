import 'package:flutter/material.dart';
import 'package:testlogin/schermate/Loginstateful.dart';
import 'package:testlogin/reusablewidgets/Textfieldregister.dart';

class Registerstatteful extends StatefulWidget {
  const Registerstatteful({Key? key}) : super(key: key);

  @override
  _RegisterstattefulState createState() => _RegisterstattefulState();
}

class _RegisterstattefulState extends State<Registerstatteful> {
  @override
  Widget build(BuildContext context) {
    /*return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: false,
          expandedHeight: 100,
          pinned: true,
          title: Text('Registrati'),
          centerTitle: true,
          backgroundColor: Colors.pink[400],
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => {Navigator.pop(context, '/')}),
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Benvenuto"),
            centerTitle: true,
          ),
        ),
        SliverList(
          //da capire perchè dà problemi
          delegate: SliverChildListDelegate([
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [TextField()],
            )
          ]),
        ),
        //),
      ],
    );*/
    return Scaffold(
      appBar: AppBar(
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
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            // wrappare expanded è fondamentale, senza non ho lo scrolling della pagina
            child: SingleChildScrollView(
              //scrollDirection: Axis.vertical,
              padding:
                  EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
              child: Column(
                children: [
                  Textfieldregister(
                      labeltext: 'Username',
                      prefixicon: Icon(Icons.person),
                      textInputAction: TextInputAction.next),
                  SizedBox(
                    height: 60,
                  ),
                  Textfieldregister(
                    labeltext: 'E-mail',
                    prefixicon: Icon(Icons.email),
                    textInputType: TextInputType.emailAddress,
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
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Textfieldregister(
                    labeltext: 'Confirm password',
                    prefixicon: Icon(Icons.lock),
                    obscuretext: true,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text('Registrati'),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(140, 70),
                        primary: Colors.pink[400],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
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
