import 'package:flutter/material.dart';
import 'package:testlogin/model/user.dart';
import 'package:testlogin/model/userdata.dart';

class Profileiconmenu extends StatelessWidget {
  final String imagepath;
  final double imagewidth;
  final double imageheight;
  final VoidCallback onclick;

  const Profileiconmenu({
    Key? key,
    required this.imageheight,
    required this.imagepath,
    required this.imagewidth,
    required this.onclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final infoutente = Userdata
        .getUser(); //usa vecchio oggetto user. voglio recuperarlo con metdo getuser

    return Column(
      children: [
        buildimage(),
        SizedBox(
          height: 24,
        ),
        buildusername(infoutente),
        SizedBox(
          height: 5,
        ),
        buildemail(infoutente)
      ],
    );
  }

  Widget buildimage() {
    final image = NetworkImage(imagepath);
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

  Widget buildusername(User u) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          u.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        Text(' '),
        Text(
          u.surname,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget buildemail(User u) {
    return Column(
      children: [
        Text(
          u.email,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
