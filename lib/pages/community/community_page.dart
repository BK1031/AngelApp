import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 28.0;
    return Scaffold(
      body: Container(
        height: 80,
        width: 700,
        decoration: BoxDecoration(color: darkBackgroundColor),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: mainColor,
                size: iconSize
              ), 
              tooltip: 'Home',
              onPressed: () {
                router.navigateTo(context, "/home", transition: TransitionType.fadeIn);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.map_outlined,
                color: mainColor,
                size: iconSize
              ), 
              tooltip: 'Map',
              onPressed: () {
                router.navigateTo(context, "/map", transition: TransitionType.fadeIn);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.message,
                color: mainColor,
                size: iconSize
              ), 
              tooltip: 'Community',
              onPressed: null
            )
          ],
        ),
      )
    );
  }

  List<Widget> newMethod(BuildContext context) {
    return [
          new CupertinoButton(
            child: new Text("Go to Map"),
            color: mainColor,
            onPressed: () {
              router.navigateTo(context, "/map", transition: TransitionType.fadeIn);
            },
          ),
        ];
  }
}

/*
Widget bottomBar = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.home,
            color: Colors.pink,
            size: 24.0
          ),
          Icon(
            Icons.map_outlined,
           color: Colors.pink,
           size: 24.0
         ),
          Icon(
           Icons.message,
            color: Colors.pink,
            size: 24.0
          )
        ]
    )
);
*/
