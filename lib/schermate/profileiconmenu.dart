import 'package:flutter/material.dart';
import 'package:testlogin/model/user.dart';
import 'package:testlogin/model/userdata.dart';

class Profileiconmenu extends StatelessWidget {
  //const profileiconmenu({ Key? key }) : super(key: key);
  final String imagepath;
  final double imagewidth;
  final double imageheight;
  final VoidCallback onclick;

  const Profileiconmenu({
    required this.imageheight,
    required this.imagepath,
    required this.imagewidth,
    required this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    final infoutente = Userdata.utente;
    /*return ListTile(
      isThreeLine: true,
      leading: buildimage(),
      contentPadding: EdgeInsets.all(20),
      trailing: buildsurname(infoutente),
      horizontalTitleGap: 10,
      title: buildusername(infoutente),
      subtitle: buildemail(infoutente),
    );*/
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        buildimage(),
        SizedBox(
          height: 24,
        ),
        buildusername(infoutente),
        SizedBox(
          height: 5,
        ),
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
}
