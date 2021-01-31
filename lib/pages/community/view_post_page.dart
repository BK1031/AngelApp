import 'dart:html';
import 'package:angel_app/models/user.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewPostPage extends StatefulWidget {
  String id;
  ViewPostPage(this.id);
  @override
  _ViewPostPageState createState() => _ViewPostPageState(this.id);
}

class _ViewPostPageState extends State<ViewPostPage> {

  String id;

  bool liked = false;

  List<Widget> posts = [];
  List<Widget> comments = [];

  final Storage _localStorage = window.localStorage;

  FocusNode commentFocusNode = FocusNode();
  TextEditingController commentController = TextEditingController();

  _ViewPostPageState(this.id);

  @override
  void initState() {
    super.initState();
    if (_localStorage.containsKey("userID")) {
      fb.database().ref("users").child(_localStorage["userID"])
          .once("value")
          .then((value) {
        setState(() {
          currUser = User.fromSnapshot(value.snapshot);
        });
        fb.database().ref("posts").child(id).once("value").then((event) {
          fb.database().ref("users").child(event.snapshot.val()["author"]).once(
              "value").then((value) {
            User user = new User.fromSnapshot(value.snapshot);
            setState(() {
              posts.add(Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: currCardColor,
                      child: new Container(
                          height: 143,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment: MainAxisAlignment
                                        .start,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        margin: EdgeInsets.only(
                                            right: 7, left: 8),
                                        padding: EdgeInsets.all(3),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius
                                                .circular(15),
                                            child: CachedNetworkImage(
                                                imageUrl: user.profilePic,
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover)
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
                                                style: TextStyle(fontSize: 15,
                                                    color: accentColor)
                                            ),
                                            new Container(
                                                height: 2
                                            ),
                                            Text(
                                                event.snapshot.val()["tags"],
                                                style: TextStyle(
                                                    fontSize: 10.5,
                                                    color: currDividerColor)
                                            ),
                                          ]
                                      ),
                                      Expanded(
                                        child: new Container(),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 1.0),
                                            child: Text(
                                                '${event.snapshot
                                                    .val()["likes"]
                                                    .toString()
                                                    .split("LIKE")
                                                    .length}',
                                                textDirection: TextDirection
                                                    .ltr,
                                                style: TextStyle(
                                                    fontSize: 11.5,
                                                    color: accentColor)
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8.0),
                                            child: FloatingActionButton(
                                                heroTag: "t413g34536",
                                                elevation: 0,
                                                child: Icon(event.snapshot
                                                    .val()["likes"]
                                                    .toString()
                                                    .contains(currUser.userID)
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                  color: event.snapshot
                                                      .val()["likes"]
                                                      .toString()
                                                      .contains(currUser
                                                      .userID)
                                                      ? mainColor
                                                      : accentColor,),
                                                tooltip: 'Like this post!',
                                                mini: true,
                                                backgroundColor: currCardColor,
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
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 13.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                                event.snapshot.val()["title"],
                                                textDirection: TextDirection
                                                    .ltr,
                                                style: TextStyle(fontSize: 16,
                                                    color: accentColor)
                                            ),
                                            new Container(
                                                height: 8
                                            ),
                                            Text(
                                                event.snapshot.val()["body"],
                                                textDirection: TextDirection
                                                    .ltr,
                                                overflow: TextOverflow
                                                    .ellipsis,
                                                style: TextStyle(fontSize: 12,
                                                    color: Colors.white)
                                            )
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ));
            });
          });
        });
        fb.database().ref("posts").child(id).child("comments").onChildAdded.listen((event) {
          fb.database().ref("users").child(event.snapshot.val()["author"]).once(
              "value").then((value) {
            User user = new User.fromSnapshot(value.snapshot);
            setState(() {
              comments.add(Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      new Container( // Comment Box
                          width: MediaQuery.of(context).size.width - 40,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column( // Individual Comment
                              children: [
                                Row( //Information Bar
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container( // Profile Picture
                                        width: 30,
                                        height: 30,
                                        margin: EdgeInsets.only(right: 7, left: 8),
                                        padding: EdgeInsets.all(3),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: CachedNetworkImage(imageUrl: user.profilePic, height: 30, width: 30, fit: BoxFit.cover)
                                        ),
                                        //Icon(Icons.person, color: currBackgroundColor, size: 25),
                                        //decoration: BoxDecoration(shape: BoxShape.circle, color: accentColor)),
                                      ),
                                      Column( // Name
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                user.username,
                                                style: TextStyle(fontSize: 15, color: accentColor)
                                            ),
                                          ]
                                      ),
                                      Expanded ( // Space between name and like counter
                                        child: new Container(),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 1.0),
                                            child: Text(
                                                '${event.snapshot
                                                    .val()["likes"]
                                                    .toString()
                                                    .split("LIKE")
                                                    .length}',
                                                textDirection: TextDirection
                                                    .ltr,
                                                style: TextStyle(
                                                    fontSize: 11.5,
                                                    color: accentColor)
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8.0),
                                            child: FloatingActionButton(
                                                heroTag: "t413grewrwrwrwe34536",
                                                elevation: 0,
                                                child: Icon(event.snapshot
                                                    .val()["likes"]
                                                    .toString()
                                                    .contains(currUser.userID)
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                  color: event.snapshot
                                                      .val()["likes"]
                                                      .toString()
                                                      .contains(currUser
                                                      .userID)
                                                      ? mainColor
                                                      : accentColor,),
                                                tooltip: 'Like this post!',
                                                mini: true,
                                                backgroundColor: currCardColor,
                                                onPressed: () {}
                                            ),
                                          )
                                        ],
                                      )
                                    ]),
                                Padding( // Comment Content
                                  padding: const EdgeInsets.all(6.0),
                                  child: new Container(
                                      width: MediaQuery.of(context).size.width - 60,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 2.0),
                                              child: Text(
                                                  event.snapshot.val()["comment"],
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(fontSize: 13, color: Colors.white)
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                )
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
      appBar: AppBar(
        backgroundColor: currCardColor,
        brightness: Brightness.dark,
        title: Text("Post Details", style: TextStyle(color: mainColor),),
      ),
      backgroundColor: currBackgroundColor,
      body: Container( // General background
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: new Column(
                children: posts,
              ),
            ),
            Container( // Comment Box
              width: MediaQuery.of(context).size.width - 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField( // Post content textbox
                      controller: commentController,
                      focusNode: commentFocusNode,
                      cursorColor: accentColor,
                      maxLines: 1,
                      decoration: InputDecoration(
                        fillColor: currCardColor,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Write your comment here',
                        labelText: 'Comment',
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                          color: accentColor,
                          fontSize: 14,
                        ),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        // action
                        fb.database().ref("posts").child(id).child("comments").push().set({
                            "author": currUser.userID,
                            "comment": commentController.text,
                            "date": DateTime.now().toString()
                        });
                        commentController.clear();
                        commentFocusNode.unfocus();
                      }
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: new Column(
                children: comments,
              ),
            ),
          ],
        )
      )
    );
  }
}