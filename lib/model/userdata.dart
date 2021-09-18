import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:testlogin/model/user.dart';

class Userdata {
  static late SharedPreferences _preferences;
  static const _keyuser = 'user'; //avrà info utente
  static const utente = User(
    imagePath: 'https://images6.alphacoders.com/108/thumb-350-1081394.png',
    email: 'creeper@creeper.com',
    name: 'Edoardo',
    surname: 'Remondini',
    about: 'Just messing around with Flutter',
  );

  static Future init() async => {
        _preferences = await SharedPreferences.getInstance(),
      };

  static Future setUser(User user) async {
    //questo metodo serve per salvare i dati nello shared preferences
    final userjson = jsonEncode(user
        .toJson()); //devo fare encode del json per ricevere stringa però invece di un map
    //salverò questa stringa nello shared preferences
    await _preferences.setString(_keyuser, userjson);

    //valore chiave è dato da json encodato(stringa), la chiave è usata per salvare valori su disco

    //await _preferences.setBool('firstaccess', true);
  }

  static User getUser() {
    final user = _preferences.getString(_keyuser);
    //uso la chiave per recuperare dati utente

    return user == null ? utente : User.fromJson(jsonDecode(
        //ho oggetto in stringa dato da jsonencode.con jsondecode lo riporto a JSON.poi con from json leggi json e istanzi oggetto user prendendo valori da Map
        //prima devo decodificare json prima di trasformarlo in ogetto User
        user)); //questo metodo serve per convertire stringa ricevuta da sharedpreference a oggetto User
  }

  /*static bool? getfirstaccessvalue() {
    bool? result = _preferences.getBool('firstaccess');
    return result;
  }*/

  /*static modifyfisrtaccess() async {
    //non funziona
    await _preferences.reload();
    await _preferences.setBool('firstaccess', false);
  }*/
}
