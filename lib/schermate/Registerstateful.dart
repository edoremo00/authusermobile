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
          SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(40),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*Textfieldregister(   CAPIRE COME USARE MIO WIDGET CUSTOM
                    labeltext: 'pippo',
                  )*/
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.android),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    labelText: 'Confirm password',
                    prefixIcon: Icon(Icons.android),
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
