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
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            padding: (EdgeInsets.all(10)),
            color: Colors.blueGrey[800],
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 10, thickness: 0),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(20),
                          color: Colors.black,
                          textColor: Colors.amber,
                          child: Container(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(Icons.person,
                                        color: Colors.black, size: 30),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.amber)),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Jane Doe',
                                          style: TextStyle(fontSize: 15)),
                                      Text(
                                          'text post text post text post text post',
                                          style: TextStyle(fontSize: 10))
                                    ])
                              ])))
                    ],
                  );
                })));
  }
}
