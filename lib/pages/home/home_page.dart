import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: Container(
        child: Column(
          children: [
            new CupertinoButton(
              child: new Text("Go to Map"),
              color: mainColor,
              onPressed: () {
                router.navigateTo(context, "/map", transition: TransitionType.fadeIn);
              },
            ),
          ],
        ),
      )
    );
  }
}