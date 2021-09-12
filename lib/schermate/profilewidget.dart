import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onclick;
  final double imagewidth;
  final double imageheight;

  const ProfileWidget(
      {required this.imagePath,
      required this.onclick,
      required this.imageheight,
      required this.imagewidth});

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
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        //senza di lui immagine non sarà ovale
        color: Colors.transparent,
        child: Ink.image(
          image: image,
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
          Icons.edit,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
