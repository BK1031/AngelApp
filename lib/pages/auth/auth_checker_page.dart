import 'dart:html';

import 'package:angel_app/models/user.dart';
import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CheckAuthPage extends StatefulWidget {
  @override
  _CheckAuthPageState createState() => _CheckAuthPageState();
}

class _CheckAuthPageState extends State<CheckAuthPage> {

  double percent = 0.2;
  bool connected = true;

  final connectionRef = fb.database().ref(".info/connected");
  final Storage _localStorage = window.localStorage;

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  Future<void> checkConnection() async {
    connectionRef.onValue.listen((event) {
      if (event.snapshot.val()) {
        setState(() {
          connected = true;
        });
        checkAuth();
      }
      else {
        setState(() {
          connected = false;
        });
      }
    });
  }

  Future<void> checkAuth() async {
    setState(() {
      percent = 0.4;
    });
    if (fb.auth().currentUser != null) {
      _localStorage["userID"] = fb.auth().currentUser.uid;
      fb.database().ref("users").child(fb.auth().currentUser.uid).once("value").then((value) {
        currUser = new User.fromSnapshot(value.snapshot);
        print("––––––––––––– DEBUG INFO ––––––––––––––––");
        print("USERNAME: ${currUser.username}}");
        print("EMAIL: ${currUser.email}");
        print("–––––––––––––––––––––––––––––––––––––––––");
        setState(() {
          percent = 1.0;
        });
        Future.delayed(const Duration(milliseconds: 800), () {
          router.navigateTo(context, "/app", transition: TransitionType.fadeIn, replace: true);
        });
      });
    }
    else {
      _localStorage.remove("userID");
      setState(() {
        percent = 1.0;
      });
      Future.delayed(const Duration(milliseconds: 800), () {
        router.navigateTo(context, "/", transition: TransitionType.fadeIn, replace: true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (connected) {
      return Scaffold(
        backgroundColor: currBackgroundColor,
        body: new Container(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: new Image.asset(
                  "images/angel-logo.png",
                  width: 100,
                ),
              ),
              Center(
                child: new CircularPercentIndicator(
                  radius: 75,
                  circularStrokeCap: CircularStrokeCap.round,
                  lineWidth: 7,
                  animateFromLastPercent: true,
                  animation: true,
                  percent: percent,
                  progressColor: mainColor,
                ),
              )
            ],
          ),
        ),
      );
    }
    else {
      return Scaffold(
        backgroundColor: currBackgroundColor,
        body: Center(
          child: Container(
            width: (MediaQuery.of(context).size.width > 1300) ? 1100 : MediaQuery.of(context).size.width - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: new Container(
                    child: new Image.asset(
                      "images/angel-logo.png",
                      width: 100,
                    ),
                  ),
                ),
                new Column(
                  children: [
                    Center(
                      child: new Text(
                        "Server Connection Error",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: accentColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                        ),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(8.0)),
                    new Text(
                      "We encountered a problem when trying to connect you to our servers. This page will automatically disappear if a connection with the server is established.\n\nTroubleshooting Tips:\n- Check your wireless connection\n- Restart the Angel application\n- Restart your device",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}