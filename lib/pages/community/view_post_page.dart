import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewPostPage extends StatefulWidget {
  @override
  _ViewPostPageState createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
  FocusNode commentFocusNode = FocusNode();
  TextEditingController commentController = TextEditingController();
  String textpostcontent = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit nunc, scelerisque ac nulla quis, ultrices mollis justo. Fusce sed ipsum nec lorem rhoncus aliquet eu nec est. Curabitur ultricies blandit orci, id varius odio egestas ut. Duis bibendum finibus metus, ut convallis tortor consectetur in. Vestibulum sollicitudin nec nisi eu pellentesque. Morbi sed cursus dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras nisl enim, dignissim sed malesuada sit amet, tempus a justo. Praesent consequat eget risus et hendrerit. Integer consectetur ipsum dolor, at posuere nunc lobortis ac. Sed ut velit nisl. Sed feugiat nulla ligula, eu consectetur elit pharetra at. Nam tempus id arcu vel tincidunt. Praesent quis augue maximus nibh iaculis porta eu eget lacus.';
  String url = 'https://miro.medium.com/max/818/1*4fnqG_q7Nj757C7f9ekOLA.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back, size: 30, color: accentColor),
              onPressed: () {
                router.navigateTo(context, "/community", transition: TransitionType.fadeIn);
              },
            ),
            ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: currCardColor,
        title: Text(
          'Return to community page',
          style: TextStyle(
            color: accentColor,
            fontSize: 20
          )
        )
      ),
      backgroundColor: currBackgroundColor,
      body: Container( // General background
        color: currCardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right:20.0),
              child: Column( // Main Post
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 15
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Container( // Post profile + tags
                      color: currBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
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
                                    child: CachedNetworkImage(imageUrl: '$url', height: 30, width: 30, fit: BoxFit.cover)
                                  ),
                                  //Icon(Icons.person, color: currBackgroundColor, size: 25),
                                  //decoration: BoxDecoration(shape: BoxShape.circle, color: accentColor)),
                                  ),
                              Column( // Name + tags
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.5
                                  ),
                                  Text(
                                    'Jane Doe', 
                                    style: TextStyle(fontSize: 15, color: accentColor)
                                  ),
                                  SizedBox(
                                    height: 2
                                  ),
                                  Text(
                                    '#tag, #tag, #tag', 
                                    style: TextStyle(fontSize: 10.5, color: currDividerColor)
                                  ),
                                ]
                              ),
                              Expanded (
                                child: new Container(),
                              ),
                            ]),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: new Container( // Actual Post
                                color: currCardColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 13.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 14.0, left: 5.0),
                                        child: Text( // Post Title
                                          'Post Title',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(fontSize: 18, color: accentColor)
                                        ),
                                      ),
                                      new Container(
                                        height: 8
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 14.0, left: 5.0, right: 10.0),
                                        child: Text( // Post Content
                                          '$textpostcontent',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(fontSize: 13, color: accentColor)
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ),
                            ),
                            //COPY HERE<<<
                            Row( // Like + Comment Counter
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row( // Like Counter
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '1.3k', // Number of likes
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: accentColor,
                                      )
                                    ),
                                    IconButton( // Like Button
                                      icon: Icon(Icons.favorite_border),
                                      color: accentColor,
                                      iconSize: 22,
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 90
                                ),
                                Row( // Comment Counter
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '650', // Number of comments
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: accentColor,
                                      )
                                    ),
                                    IconButton( // Comment Icon, technically button but doesn't need to have function
                                      icon: Icon(Icons.message_outlined),
                                      color: accentColor,
                                      iconSize: 22,
                                      onPressed: () {},
                                    )
                                  ],
                                )
                              ],)
                          ],
                        ),
                      )),
                    ),
                  ],
                )
              ),
            //here
            SizedBox(
              height: 10
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
                        commentController.clear();
                        commentFocusNode.unfocus();
                      }
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Container( // Comment Box
                  width: MediaQuery.of(context).size.width - 40,
                  color: currBackgroundColor, 
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
                                child: CachedNetworkImage(imageUrl: '$url', height: 30, width: 30, fit: BoxFit.cover)
                              ),
                              //Icon(Icons.person, color: currBackgroundColor, size: 25),
                              //decoration: BoxDecoration(shape: BoxShape.circle, color: accentColor)),
                              ),
                          Column( // Name
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Jane Doe', 
                                style: TextStyle(fontSize: 15, color: accentColor)
                              ),
                            ]
                          ),
                          Expanded ( // Space between name and like counter
                            child: new Container(),
                          ),
                          Row( // Like Button + Counter
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: Text(
                                    '1.3k',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(fontSize: 13, color: accentColor)
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8.0),
                                child: FloatingActionButton(
                                  child: Icon(Icons.favorite_border, color: accentColor),
                                  tooltip: 'Like this post!',
                                  mini: true,
                                  backgroundColor: currBackgroundColor,
                                  onPressed: () {} // onPressed
                                ),
                              )
                            ],
                          )
                        ]),
                        Padding( // Comment Content
                          padding: const EdgeInsets.all(6.0),
                          child: new Container(
                            width: MediaQuery.of(context).size.width - 60,
                            color: currCardColor,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 2.0),
                                    child: Text(
                                      'Very cool!',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(fontSize: 13, color: accentColor)
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
            )
          ],
        )
      )
    );
  }
}