import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: currBackgroundColor,
        body: Container(
            margin: EdgeInsets.only(left: 15),
            padding:
                (EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 20)),
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
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: CachedNetworkImage(
                                            imageUrl:
                                                'https://picsum.photos/250?image=9',
                                            height: 30,
                                            width: 30,
                                            fit: BoxFit.cover))),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Jane Doe'),
                                      Text(
                                          'text post text post text post text post...',
                                          style: TextStyle(fontSize: 10))
                                    ])
                              ])))
                    ],
                  );
                })));
  }
}
