import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuBarPage extends StatefulWidget {
  @override
  _MenuBarPageState createState() => _MenuBarPageState();
}

class _MenuBarPageState extends State<MenuBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currBackgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right:20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}