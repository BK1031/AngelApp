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
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    TextEditingController tagsController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: currCardColor,
        title: Text(
          'Create new post',
          style: TextStyle(
            color: accentColor,
            fontSize: 22
          )
        )
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width/2) - 40,
                          height: 40,
                          child: RaisedButton( // Cancel button
                            child: Container(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: currDividerColor,
                                  fontSize: 13,
                                )
                              )
                            ),
                            color: currCardColor,
                            onPressed: () {
                              router.navigateTo(context, "/community", transition: TransitionType.fadeIn);
                            }
                          ),
                        ),
                        SizedBox(
                          width: 30
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width/2) - 40,
                          height: 40,
                          child: RaisedButton( // Publish button
                            child: Container(
                              child: Text(
                                'Publish',
                                style: TextStyle(
                                  color: currBackgroundColor,
                                  fontSize: 15,
                                )
                              )
                            ),
                            color: accentColor,
                            onPressed: () {
                              // Collect user data
                              debugPrint('$titleController \n $contentController \n $tagsController');
                              router.navigateTo(context, "/community", transition: TransitionType.fadeIn);
                            }
                          ),
                        )
                      ],
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