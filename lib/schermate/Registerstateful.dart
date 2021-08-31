import 'package:flutter/material.dart';

class Registerstatteful extends StatefulWidget {
  const Registerstatteful({Key? key}) : super(key: key);

  @override
  _RegisterstattefulState createState() => _RegisterstattefulState();
}

class _RegisterstattefulState extends State<Registerstatteful> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
        /*SliverList(//da capire perchè dà problemi
          delegate: ,
          ),*/
        //),
      ],
    );
  }
}
