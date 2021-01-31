import 'dart:html';

import 'package:angel_app/models/user.dart';
import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';

class AddNewPostPage extends StatefulWidget {
  @override
  _AddNewPostPageState createState() => _AddNewPostPageState();
}

class _AddNewPostPageState extends State<AddNewPostPage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController tagsController = TextEditingController();

  final Storage _localStorage = window.localStorage;

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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: currCardColor,
          brightness: Brightness.dark,
          title: Text("New Post", style: TextStyle(color: mainColor),),
        ),
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
                    TextField( // Title textbox
                      controller: titleController,
                      cursorColor: accentColor,
                      maxLength: 50,
                      maxLines: 1,
                      decoration: InputDecoration(
                        fillColor: currCardColor,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Enter the title of your post here',
                        labelText: 'Title',
                        hintStyle: TextStyle(
                          color: accentColor,
                          fontSize: 14,
                        ),
                      )
                    ),
                    SizedBox(
                      height: 15
                    ),
                    TextField( // Post content textbox
                      controller: contentController,
                      cursorColor: accentColor,
                      maxLength: 700,
                      maxLines: 17,
                      decoration: InputDecoration(
                        fillColor: currCardColor,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Type your post here',
                        labelText: 'Post content',
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                          color: accentColor,
                          fontSize: 14,
                        ),
                      )
                    ),
                    SizedBox(
                      height: 15
                    ),
                    TextField( // Tags textbox
                      controller: tagsController,
                      cursorColor: accentColor,
                      maxLength: 200,
                      maxLines: 1,
                      decoration: InputDecoration(
                        fillColor: currCardColor,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Add relevant tags separated by spaces, e.g. #safety #awareness #college',
                        labelText: 'Tags',
                        hintStyle: TextStyle(
                          color: accentColor,
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.add,
                          color: accentColor,
                          size: 20
                        )
                      )
                    ),
                    /*Expanded(
                      child: Row()
                    ),*/
                    SizedBox(
                      height: 15
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: CupertinoButton( // Publish button
                        child: Container(
                          child: Text(
                            'Publish',
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 20,
                            )
                          )
                        ),
                        color: currCardColor,
                        onPressed: () {
                          fb.database().ref("posts").push().set({
                            "author": currUser.userID,
                            "date": DateTime.now().toString(),
                            "title": titleController.text,
                            "body": contentController.text,
                            "tags": tagsController.text.split(" ").join(", "),
                          });
                          router.pop(context);
                        }
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      )
    );
    
  }
}