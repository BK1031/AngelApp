import 'dart:html';

import 'package:angel_app/models/user.dart';
import 'package:angel_app/utils/config.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final Storage _localStorage = window.localStorage;

  User user = new User();

  String password = "";
  String confirm = "";

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
                      user.username = input;
                    },
                    cursorColor: accentColor,
                    decoration: InputDecoration(
                        labelText: 'Username',
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
                new Padding(padding: EdgeInsets.all(8)),
                TextField(
                    onChanged: (input) {
                      confirm = input;
                    },
                    cursorColor: accentColor,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: accentColor),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)))),
                new Padding(padding: EdgeInsets.all(8)),
                DateTimeField(
                  format: DateFormat("yyyy-MM-dd"),
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    labelStyle: TextStyle(color: accentColor),
                    border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2))),
                  cursorColor: accentColor,
                  onChanged: (date) {
                    print("Set bday $date");
                    user.birthday = date;
                  },
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      return date;
                    } else {
                      return currentValue;
                    }
                  },
                ),
                new Padding(padding: EdgeInsets.all(32)),
                new Container(
                  width: double.infinity,
                  child: CupertinoButton(
                    onPressed: () {
                      if (user.email == "" || user.username == "") {
                        window.alert("Email and Username cannot be empty!");
                      }
                      else if (password != confirm) {
                        window.alert("Passwords do not match!");
                      }
                      else {
                        fb.auth().setPersistence("local");
                        try {
                          fb.auth().createUserWithEmailAndPassword(user.email, password).then((value) async {
                            currUser.userID = value.user.uid;
                            _localStorage["userID"] = fb.auth().currentUser.uid;
                            await fb.database().ref("users").child(currUser.userID).set({
                              "username": user.username,
                              "email": user.email.toLowerCase(),
                              "profilePic": user.profilePic,
                              "birthday": user.birthday.toString(),
                              "allowContact": true,
                            });
                            router.navigateTo(context, "/check-auth", transition: TransitionType.fadeIn, replace: true);
                          });
                        } catch (e) {
                          window.alert("An error occured while creating your account: ${e.toString()}");
                        }
                      }
                    },
                    color: mainColor,
                    child: new Text("Create Account", style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                ),
                new Padding(padding: EdgeInsets.all(8)),
                new Container(
                  width: double.infinity,
                  child: CupertinoButton(
                    onPressed: () {
                      router.navigateTo(context, "/login", transition: TransitionType.fadeIn, replace: true);
                    },
                    child: new Text("Already have an account?", style: TextStyle(fontSize: 20, color: accentColor),),
                  ),
                ),
              ],
            )));
  }
}
