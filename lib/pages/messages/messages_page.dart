import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/utils/config.dart';
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
        floatingActionButton: new RaisedButton(
            child: Text("GO BACK"),
            color: mainColor,
            textColor: Colors.white,
            onPressed: () {
              router.pop(context);
            }),
        backgroundColor: currBackgroundColor,
        body: Container(
            margin: EdgeInsets.only(left: 10),
            padding: (EdgeInsets.all(10)),
            decoration: BoxDecoration(
                color: currCardColor,
                border: Border(
                    left: BorderSide(color: accentColor, width: 2),
                    right: BorderSide(color: accentColor, width: 2))),
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
                                                'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.eharmony.co.uk%2Fdating-advice%2Fwp-content%2Fuploads%2F2011%2F04%2Fprofilephotos-960x640.jpg&imgrefurl=https%3A%2F%2Fwww.eharmony.co.uk%2Fdating-advice%2Fusing-eharmony%2Fdating-profile-pictures-you-need&tbnid=kfAk523mhI1dfM&vet=12ahUKEwi9tpDZ-cTuAhUNaKwKHZI5CHQQMygWegUIARD9AQ..i&docid=MXCLI9y8n7n4VM&w=960&h=640&q=profile%20pic&safe=strict&ved=2ahUKEwi9tpDZ-cTuAhUNaKwKHZI5CHQQMygWegUIARD9AQ',
                                            height: 30,
                                            width: 30,
                                            fit: BoxFit.cover))),
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
