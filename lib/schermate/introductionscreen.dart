import 'package:flutter/material.dart';
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
    return SafeArea(
        child: Scaffold(
      body: IntroductionScreen(
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
                  onPressed: () {},
                ),
                IconButton(
                  enableFeedback: true,
                  tooltip: 'Instagram',
                  icon: Image.asset(
                    'android/assets/instagramlogo.png',
                    width: 150,
                    height: 150,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  enableFeedback: true,
                  tooltip: 'Twitter',
                  icon: Image.asset(
                    'android/assets/twitterlogo.png',
                    width: 150,
                    height: 150,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
