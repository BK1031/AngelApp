import 'dart:html';

import 'package:angel_app/models/user.dart';
import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {

  final Storage _localStorage = window.localStorage;

  List<Widget> posts = [];

  @override
  void initState() {
    super.initState();
    if (_localStorage.containsKey("userID")) {
      fb.database().ref("users").child(_localStorage["userID"]).once("value").then((value) {
        setState(() {
          currUser = User.fromSnapshot(value.snapshot);
        });
        fb.database().ref("posts").onChildAdded.listen((event) {
          fb.database().ref("users").child(event.snapshot.val()["author"]).once("value").then((value) {
            User user = new User.fromSnapshot(value.snapshot);
            setState(() {
              posts.add(Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: currCardColor,
                      child: InkWell(
                        onTap: () {
                          router.navigateTo(context, "/community/${event.snapshot.key}", transition: TransitionType.fadeIn);
                        },
                        child: new Container(
                            height: 143,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          margin: EdgeInsets.only(right: 7, left: 8),
                                          padding: EdgeInsets.all(3),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: CachedNetworkImage(imageUrl: user.profilePic, height: 30, width: 30, fit: BoxFit.cover)
                                          ),
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              new Container(
                                                  height: 2.5
                                              ),
                                              Text(
                                                  user.username,
                                                  style: TextStyle(fontSize: 15, color: accentColor)
                                              ),
                                              new Container(
                                                  height: 2
                                              ),
                                              Text(
                                                  event.snapshot.val()["tags"],
                                                  style: TextStyle(fontSize: 10.5, color: currDividerColor)
                                              ),
                                            ]
                                        ),
                                        Expanded (
                                          child: new Container(),
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 1.0),
                                              child: Text(
                                                  '${event.snapshot.val()["likes"].toString().split("LIKE").length}',
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(fontSize: 11.5, color: accentColor)
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8, right: 8.0),
                                              child: FloatingActionButton(
                                                elevation: 0,
                                                  child: Icon(event.snapshot.val()["likes"].toString().contains(currUser.userID) ? Icons.favorite : Icons.favorite_border, color: event.snapshot.val()["likes"].toString().contains(currUser.userID) ? mainColor : accentColor,),
                                                  tooltip: 'Like this post!',
                                                  mini: true,
                                                  backgroundColor: currBackgroundColor,
                                                  onPressed: () {}
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: new Container(
                                        height: 75,
                                        color: currCardColor,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 13.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  event.snapshot.val()["title"],
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(fontSize: 16, color: accentColor)
                                              ),
                                              new Container(
                                                  height: 8
                                              ),
                                              Text(
                                                  event.snapshot.val()["body"],
                                                  textDirection: TextDirection.ltr,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontSize: 12, color: Colors.white)
                                              )
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ));
            });
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currBackgroundColor,
      floatingActionButton: new FloatingActionButton(
        onPressed: AddNewPost,
        backgroundColor: accentColor,
        tooltip: 'Create new post',
        child: Icon(Icons.add, color: currBackgroundColor, size: 30),
        ),
        body: Container(
          color: currCardColor,
          padding: (EdgeInsets.all(16)),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: new Column(
              children: posts,
            ),
          )
   )
    );
  }

  void AddNewPost() {
    router.navigateTo(context, "/newpost", transition: TransitionType.fadeIn);
  }
}