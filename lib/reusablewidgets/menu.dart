import 'package:flutter/material.dart';
import 'package:testlogin/model/userdata.dart';
import 'package:testlogin/schermate/profileiconmenu.dart';

//APPROCIO CREAZIONE VOCI MENU DRAWER TRAMITE FUNZIONE
class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final infoutente = Userdata.utente;
    return Drawer(
      child: Material(
        //Material deve essere prima di un listitle così posso avere un feedback se ci clicco sopra
        color: Colors.white10,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 200,
              child: Profileiconmenu(
                imageheight: 100,
                imagewidth: 100,
                imagepath: infoutente.imagePath,
                onclick: () => {},
              ),
            ),
            Divider(
              color: Colors.black54,
              indent: 20,
              endIndent: 20,
            ),
            menuitems(
                coloreicona: Colors.black87,
                icona: Icons.home_outlined,
                testo: 'Home',
                funzioneontap: () => {}),
            SizedBox(
              height: 20,
            ),
            menuitems(
                coloreicona: Colors.black87,
                icona: Icons.person_outline,
                testo: 'Gestione Profilo',
                funzioneontap: () => {
                      Navigator.pop(
                          context), //questo chiude il menu. cosi tornando indietro non lo trovo aperto
                      Navigator.pushNamed(context,
                          'gestioneprofilo') //BUG NON FUNZIONA NAVIGAZIONE
                    }),
            SizedBox(
              height: 20,
            ),
            menuitems(
              coloreicona: Colors.black87,
              icona: Icons.logout_outlined,
              testo: 'Logout',
              funzioneontap: () => {},
            ),
            SizedBox(
              height: 20,
            ),
            /*SizedBox(
              height: 48,
            ),*/
            Divider(
              color: Colors.black54,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Made with',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red[900],
                ),
                Text(
                  'by Edoardo Remondini',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget menuitems(
    {String testo = 'default',
    Color coloretesto = Colors.black87,
    double grandezzatesto = 16,
    FontWeight spessoretesto = FontWeight.w400,
    IconData? icona,
    Color? coloreicona,
    Color? coloretile,
    VoidCallback? funzioneontap}) {
  return ListTile(
    minLeadingWidth: 2,
    //contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    tileColor: coloretile,
    leading: Icon(
      icona,
      color: coloreicona,
    ),
    title: Text(
      testo,
      style: TextStyle(
        color: coloretesto,
        fontSize: grandezzatesto,
        fontWeight: spessoretesto,
      ),
    ),
    onTap: funzioneontap,
  );
}
