import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/utils/theme.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                padding: EdgeInsets.all(20),
                color: currBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                        height: 45, image: AssetImage('images/angel-logo.png')),
                    TextField(
                        cursorColor: accentColor,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)))),
                    TextField(
                        cursorColor: accentColor,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(color: accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)))),
                    TextField(
                        cursorColor: accentColor,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)))),
                    TextField(
                        cursorColor: accentColor,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(color: accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)))),
                    TextField(
                        cursorColor: accentColor,
                        decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            labelStyle: TextStyle(color: accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)))),
                    CheckboxListTile(
                        onChanged: (bool newValue) {
                          setState(() {});
                        },
                        value: false,
                        title: Text(
                            'I accept the site Terms of Service and agree to the Privacy Policy.',
                            style: TextStyle(fontSize: 12))),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 40,
                        height: 40,
                        child: RaisedButton(
                            color: accentColor,
                            textColor: currBackgroundColor,
                            child: Text('Submit'),
                            onPressed: () {
                              //go to main app
                            })),
                    RaisedButton(
                        child: Text('Sign in with Google'), onPressed: () {})
                  ],
                ))));
  }
}
