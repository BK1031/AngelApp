import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewPostPage extends StatefulWidget {
  @override
  _AddNewPostPageState createState() => _AddNewPostPageState();
}

class _AddNewPostPageState extends State<AddNewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currBackgroundColor,
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        backgroundColor: accentColor,
        tooltip: 'Create new post',
        child: Icon(Icons.add, color: currBackgroundColor, size: 30),
        ),
        body: Container(
          color: currCardColor,
          margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 15),
          padding: (EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10)),
          width: MediaQuery.of(context).size.width,
          //child: 
   )
    );
  }
}