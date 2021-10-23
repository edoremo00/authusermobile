import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:testlogin/model/firstseen.dart';

class Introscreenv2 extends StatelessWidget {
  const Introscreenv2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String twitterurl = 'https://twitter.com/EdoardoRemondi1';
    final String instagramurl = 'https://www.instagram.com/remons_00/';
    final String githuburl = 'https://github.com/edoremo00';
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(24),
          children: [
            Image.asset(
              'android/assets/minecraftavatar.png',
              height: 300,
              width: 400,
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Benvenuto!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Text(
                    'Sono Edoardo e questa è',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Text(
                  'un APP fantastica!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  tooltip: 'Github',
                  enableFeedback: true,
                  icon: Image.asset(
                    'android/assets/githublogo.png',
                    width: 250,
                    height: 250,
                  ),
                  onPressed: () async {
                    _launchURLsocialurls(context, githuburl);
                  },
                ),
                IconButton(
                  enableFeedback: true,
                  tooltip: 'Instagram',
                  icon: Image.asset(
                    'android/assets/instagramlogo.png',
                    width: 250,
                    height: 250,
                  ),
                  onPressed: () async {
                    _launchURLsocialurls(context, instagramurl);
                  },
                ),
                IconButton(
                  enableFeedback: true,
                  tooltip: 'Twitter',
                  icon: Image.asset(
                    'android/assets/twitterlogo.png',
                    width: 250,
                    height: 250,
                  ),
                  onPressed: () async {
                    _launchURLsocialurls(context, twitterurl);
                  },
                ),
              ],
            ),
          ],
        ),
        /*floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: IconButton(
            iconSize: 30,
            enableFeedback: true,
            tooltip: 'Iniziamo',
            icon: Icon(Icons.arrow_forward_ios_rounded),
            onPressed: () {},
          ),
        ),*/
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 15, right: 4),
          child: FloatingActionButton(
            tooltip: "Usa l'app",
            onPressed: () async => {
              await Firstseen.toggleseen(),
              await Navigator.of(context).pushReplacementNamed('LoginPage')
            },
            backgroundColor: Color.fromARGB(255, 52, 156, 225),
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }

  void _launchURLsocialurls(BuildContext context, String url) async {
    try {
      await launch(
        url,
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),

          // or user defined animation.

          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Theme.of(context).primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
