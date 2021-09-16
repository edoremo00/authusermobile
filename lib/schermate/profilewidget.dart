import 'dart:io';

import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  String imagePath;
  final VoidCallback onclick;
  final double imagewidth;
  final double imageheight;
  bool isedit;

  ProfileWidget(
      {required this.imagePath,
      required this.onclick,
      required this.imageheight,
      required this.imagewidth,
      required this.isedit});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        //di default posiziona widget in alto a sinistra
        //grazie allo stack puoi sovrapporre più widget uno sopra l'altro
        children: [
          buildimage(),
          Positioned(
            //serve per posizionare dove voglio i figli di uno stack
            child: buildeditbutton(),
            right: 4,
            bottom: 0,
          )
        ],
      ),
    );
  }

  Widget buildimage() {
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return ClipOval(
      child: Material(
        //senza di lui immagine non sarà ovale
        color: Colors.transparent,
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: imagewidth,
          height: imageheight,
          child: InkWell(
            //grazie ad esso ho un effetto se clicco sopra l'immagine
            onTap: onclick,
          ),
        ),
      ),
    );
  }

  Widget buildeditbutton() {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.blue,
        child: Icon(
          isedit ? Icons.add_a_photo : Icons.edit,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
