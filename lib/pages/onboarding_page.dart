import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: currBackgroundColor,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Padding(padding: EdgeInsets.all(16)),
                Center(
                  child: Image(
                      height: 50, image: AssetImage('images/angel-logo.png')),
                ),
                new Padding(padding: EdgeInsets.all(16)),
                Text(
                    "Welcome to\nAngel",
                    style: TextStyle(color: mainColor, fontSize: 40, fontWeight: FontWeight.bold)
                ),
                new Padding(padding: EdgeInsets.all(16)),
                new Padding(padding: EdgeInsets.all(32)),
                new Container(
                  width: double.infinity,
                  child: CupertinoButton(
                      color: mainColor,
                      child: new Text("Get Started", style: TextStyle(fontSize: 20, color: Colors.white),),
                    onPressed: () {
                      router.navigateTo(context, "/register",
                          transition: TransitionType.fadeIn, replace: true);
                    }
                    ),
                )
              ],
            )));
  }
}
