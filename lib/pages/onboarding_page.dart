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
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Text("Quick links to pages for testing\n(replace later)"),
            new CupertinoButton(
              child: new Text("Go to Home"),
              color: mainColor,
              onPressed: () {
                router.navigateTo(context, "/home", transition: TransitionType.fadeIn);
              },
            ),
            new CupertinoButton(
              child: new Text("Go to Map"),
              color: mainColor,
              onPressed: () {
                router.navigateTo(context, "/map", transition: TransitionType.fadeIn);
              },
            ),
            new CupertinoButton(
              child: new Text("Go to Community"),
              color: mainColor,
              onPressed: () {
                router.navigateTo(context, "/community", transition: TransitionType.fadeIn);
              },
            ),
            new CupertinoButton(
              child: new Text("Go to Messages"),
              color: mainColor,
              onPressed: () {
                router.navigateTo(context, "/messages", transition: TransitionType.fadeIn);
              },
            ),
          ],
        ),
      ),
    );
  }
}