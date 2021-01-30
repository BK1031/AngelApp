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
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'trending',
              style: TextStyle(
                fontSize: 30,
                color: Colors.yellow[100],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25.0),
              height: 140.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    color: Colors.yellow[50],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[100],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[200],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[300],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[400],
                  ),
                ],
              ),
            ),
            Text(
              'personal safety',
              style: TextStyle(
                fontSize: 30,
                color: Colors.yellow[100],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25.0),
              height: 140.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    color: Colors.yellow[50],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[100],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[200],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[300],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[400],
                  ),
                ],
              ),
            ),
            Text(
              'self-care',
              style: TextStyle(
                fontSize: 30,
                color: Colors.yellow[100],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25.0),
              height: 140.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    color: Colors.yellow[50],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[100],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[200],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[300],
                  ),
                  Container(
                    width: 200.0,
                    color: Colors.yellow[400],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
