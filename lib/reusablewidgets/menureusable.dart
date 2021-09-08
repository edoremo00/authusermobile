import 'package:flutter/material.dart';

//APPROCIO CREAZIONE VOCI MENU DRAWER TRAMITE CLASSE
class Reusablemenu extends StatefulWidget {
  //const Reusablemenu({ Key? key }) : super(key: key);

  final String titolo;
  final Color? coloretesto;
  final Color? coloreicona;
  final double? grandezzatesto;
  final FontWeight? spessoretesto;
  final IconData? iconaleading;
  final Widget? leadingwidget;
  final VoidCallback? funzioneontap;

  const Reusablemenu(
      {this.coloretesto,
      this.funzioneontap,
      this.grandezzatesto,
      this.iconaleading,
      this.leadingwidget,
      this.spessoretesto,
      required this.titolo,
      this.coloreicona});

  @override
  _ReusablemenuState createState() => _ReusablemenuState();
}

class _ReusablemenuState extends State<Reusablemenu> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 2,
      leading: Icon(
        widget.iconaleading,
        color: widget.coloreicona,
      ),
      title: Text(
        widget.titolo,
        style: TextStyle(
            fontWeight: widget.spessoretesto,
            fontSize: widget.grandezzatesto,
            color: widget.coloretesto),
      ),
      onTap: widget.funzioneontap,
    );
  }
}
