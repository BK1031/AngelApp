import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: new RaisedButton(
            child: Text("GO BACK"),
            color: mainColor,
            textColor: Colors.white,
            onPressed: () {
              router.pop(context);
            }),
        backgroundColor: Colors.black,
        body: Container(
            margin: EdgeInsets.all(10),
            padding: (EdgeInsets.all(10)),
            color: Colors.blueGrey[800],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlatButton(
                    onPressed: () {},
                    color: Colors.black,
                    textColor: Colors.amber,
                    child: Container(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Container(
                              child: Icon(Icons.person, color: Colors.black),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.amber)),
                          Text('Jane Doe')
                        ])))
              ],
            )));
  }
}
