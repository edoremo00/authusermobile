import 'package:flutter/material.dart';

//APPROCIO CREAZIONE VOCI MENU DRAWER TRAMITE FUNZIONE
class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        //Material deve essere prima di un listitle così posso avere un feedback se ci clicco sopra
        color: Colors.pink[200],
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.topLeft,
              height: 100,
              child: Icon(
                Icons.android_outlined,
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 52, 156, 225),
                  Color.fromARGB(255, 142, 69, 173)
                ],
              )),
            ),
            SizedBox(
              height: 20,
            ),
            menuitems(
                coloreicona: Colors.black87,
                icona: Icons.home_outlined,
                testo: 'Home',
                funzioneontap: () => {}),
            SizedBox(
              height: 48,
            ),
            menuitems(
                coloreicona: Colors.black87,
                icona: Icons.person_outline,
                testo: 'Gestione Profilo',
                funzioneontap: () => {
                      Navigator.pushNamed(context,
                          'gestioneprofilo') //BUG NON FUNZIONA NAVIGAZIONE
                    }),
            SizedBox(
              height: 48,
            ),
            menuitems(
                coloreicona: Colors.black87,
                icona: Icons.logout_outlined,
                testo: 'Esci',
                funzioneontap: () => {}),
            SizedBox(
              height: 48,
            ),
            Divider(
              color: Colors.white70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            )
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
    FontWeight spessoretesto = FontWeight.bold,
    IconData? icona,
    Color? coloreicona,
    Color? coloretile,
    VoidCallback? funzioneontap}) {
  return ListTile(
    minLeadingWidth: 2,
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
