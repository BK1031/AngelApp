import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Anushka';
  String email = 'anushk@gmail.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: currBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          color: accentColor, 
          iconSize: 24,
          onPressed: () {
            router.navigateTo(context, "/community", transition: TransitionType.fadeIn);
          },
        ),
      ),
      backgroundColor: currBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container( // Profile picture
            child: Icon(Icons.person, color: currBackgroundColor, size: 150),
            decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
          ),
          SizedBox(
            height: 60
          ),
          Column( // Information
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row( // Name
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 20,
                        )
                      ),
                    ),
                    SizedBox(
                      width: 30
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Container(
                        height: 50,
                        width: 235,
                        color: currCardColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13.0, left: 13),
                          child: Text(
                            '$name',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 20,
                            )
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row( // Email
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 20,
                        )
                      ),
                    ),
                    SizedBox(
                      width: 30
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Container(
                        height: 50,
                        width: 235,
                        color: currCardColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13.0, left: 13),
                          child: Text(
                            '$email',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 20,
                            )
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 75,
              ),
              Row( // Bottom buttons
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width/2) - 40,
                    height: 40,
                    child: RaisedButton( // Log out button
                      child: Container(
                        child: Text(
                          'Log out',
                          style: TextStyle(
                            color: currDividerColor,
                            fontSize: 13,
                          )
                        )
                      ),
                      color: currCardColor,
                      onPressed: () {
                        router.navigateTo(context, "/login", transition: TransitionType.fadeIn);
                      }
                    ),
                  ),
                  SizedBox(
                    width: 30
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width/2) - 40,
                    height: 40,
                    child: RaisedButton( // Edit profile button
                      child: Container(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: currBackgroundColor,
                            fontSize: 15,
                          )
                        )
                      ),
                      color: accentColor,
                      onPressed: () {
                        // Edit profile page
                        // router.navigateTo(context, "/community", transition: TransitionType.fadeIn);
                      }
                    ),
                  )
                ],
              )
            ],
          )
        ],
      )
    );
  }
}
