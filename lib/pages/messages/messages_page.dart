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
        backgroundColor: currBackgroundColor,
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            padding: (EdgeInsets.all(10)),
            color: currCardColor,
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
                          color: currBackgroundColor,
                          textColor: accentColor,
                          child: Container(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(2),
                                    child: Icon(Icons.person,
                                        color: currBackgroundColor, size: 30),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: accentColor)),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Jane Doe'),
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
