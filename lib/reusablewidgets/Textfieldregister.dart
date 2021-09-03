import 'package:flutter/material.dart';

class Textfieldregister extends StatefulWidget {
  //Textfieldregister({Key? key}) : super(key: key);
  final String labeltext;
  final Icon? iconalabel;

  Textfieldregister(
      {this.iconalabel,
      required this.labeltext}); //graffe indicano che i parametri sono opzionali

  @override
  _TextfieldregisterState createState() => _TextfieldregisterState();
}

class _TextfieldregisterState extends State<Textfieldregister> {
  get labeltext =>
      null; // se metto null vedo widget sennò problema di overflow bottom

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          labelText: this.labeltext),
    );
  }
}
