import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                        controller: usernameController,
                        cursorColor: accentColor,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(color: accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)))),
                    TextField(
                        controller: passwordController,
                        cursorColor: accentColor,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)))),
                    Row( // Bottom buttons
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width/2) - 40,
                          height: 40,
                          child: RaisedButton( // Forgot password button
                            child: Container(
                              child: Text(
                                'Forgot password',
                                style: TextStyle(
                                  color: currDividerColor,
                                  fontSize: 13,
                                )
                              )
                            ),
                            color: currCardColor,
                            onPressed: () {
                              // Redirect to web page
                            }
                          ),
                        ),
                        SizedBox(
                          width: 30
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width/2) - 40,
                          height: 40,
                          child: RaisedButton( // Log in button
                            child: Container(
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  color: currBackgroundColor,
                                  fontSize: 15,
                                )
                              )
                            ),
                            color: accentColor,
                            onPressed: () {
                              // Check username/password
                              router.navigateTo(context, "/map", transition: TransitionType.fadeIn);
                            }
                          ),
                        )
                      ],
                    ),
                    RaisedButton(
                        child: Text('Sign in with Google'), onPressed: () {}),
                    SizedBox(
                      height: 60
                    )
                  ],
                ))));
  }
}
