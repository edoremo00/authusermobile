import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:testlogin/model/firstseen.dart';

class Introscreen extends StatefulWidget {
  Introscreen({Key? key}) : super(key: key);

  @override
  _IntroscreenState createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  @override
  Widget build(BuildContext context) {
    final String twitterurl = 'https://twitter.com/EdoardoRemondi1';
    final String instagramurl = 'https://www.instagram.com/remons_00/';
    final String githuburl = 'https://github.com/edoremo00';

    //isfirstaccess();
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          //dotsDecorator: DotsDecorator(),
          //showDoneButton: true,
          //showSkipButton: true,
          //showNextButton: true,
          next: Text('next'),
          skip: Text('skip'),
          done: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () async => {
              await Firstseen.toggleseen(),
              await Navigator.of(context).pushReplacementNamed('LoginPage')
            },
          ),
          onDone: () {},
          //onSkip: () {},
          pages: [
            PageViewModel(
              title: 'Benvenuto!',
              body: 'sono Edoardo e questa è un applicazione fantastica!',
              image: Center(
                child: Image.asset('android/assets/minecraftavatar.png'),
              ),
              decoration: PageDecoration(
                descriptionPadding: EdgeInsets.all(16),
                titleTextStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                imagePadding: EdgeInsets.all(20),
              ),
              useScrollView: true,
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    tooltip: 'Github',
                    enableFeedback: true,
                    icon: Image.asset(
                      'android/assets/githublogo.png',
                      width: 150,
                      height: 150,
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
                      width: 150,
                      height: 150,
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
                      width: 150,
                      height: 150,
                    ),
                    onPressed: () async {
                      _launchURLsocialurls(context, twitterurl);
                    },
                  ),
                ],
              ),
            ),
          ],
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
