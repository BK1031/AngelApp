import 'dart:html';
import 'package:firebase/firebase.dart' as fb;
import 'package:angel_app/models/user.dart';
import 'package:angel_app/utils/config.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/utils/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Storage _localStorage = window.localStorage;

  User user = new User();

  String password = "";
  String email = "";

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
                    "Login to\nAngel",
                    style: TextStyle(color: mainColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)
                ),
                new Padding(padding: EdgeInsets.all(16)),
                TextField(
                    onChanged: (input) {
                      user.email = input;
                    },
                    cursorColor: accentColor,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: accentColor),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)))),
                new Padding(padding: EdgeInsets.all(8)),
                TextField(
                    onChanged: (input) {
                      password = input;
                    },
                    cursorColor: accentColor,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: accentColor),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)))),
                new Padding(padding: EdgeInsets.all(32)),
                new Container(
                  width: double.infinity,
                  child: CupertinoButton(
                    onPressed: () {
                      fb.auth().setPersistence("local");
                      try {
                        fb.auth().signInWithEmailAndPassword(
                            user.email, password).then((value) async {
                          currUser.userID = value.user.uid;
                          _localStorage["userID"] = fb
                              .auth()
                              .currentUser
                              .uid;
                          router.navigateTo(context, "/check-auth",
                              transition: TransitionType.fadeIn, replace: true);
                        });
                      } catch (e) {
                        window.alert(
                            "An error occured while logging into your account: ${e
                                .toString()}");
                      }
                    },
                    color: mainColor,
                    child: new Text("Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                ),
                new Padding(padding: EdgeInsets.all(8)),
                new Container(
                  width: double.infinity,
                  child: CupertinoButton(
                    onPressed: () {},
                    child: new Text("Forgot Password?",
                      style: TextStyle(fontSize: 20, color: accentColor),),
                  ),
                ),
              ],
            )));
  }
}
