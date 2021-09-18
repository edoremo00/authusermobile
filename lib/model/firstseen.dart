import 'package:shared_preferences/shared_preferences.dart';

class Firstseen {
  static late SharedPreferences firstaccess;

  static Future init() async => {
        firstaccess = await SharedPreferences.getInstance(),
      };

  static bool checkfirsseen() {
    bool? seen = firstaccess.getBool('firstaccess');
    if (seen == null) {
      firstaccess.setBool('firstaccess', false);
      print('NEVER SEEN');
      return true; //è il primo accesso perchè variabile era null.ritorna true e mostra schermata benvenuto
    } else if (seen == false) {
      return true;
    } else {
      return false;
    }
  }

  static toggleseen() async {
    // i toggle the value when the user clicks on the arrow in the welcome page and then navigate to loginpage
    firstaccess.setBool('firstaccess', true);
  }
}
