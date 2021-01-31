import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    String url = 'https://miro.medium.com/max/818/1*4fnqG_q7Nj757C7f9ekOLA.png';
    double iconSize = 28.0;
    int likeButtonNumber = 0;
    Icon likeButton = Icon(
      Icons.favorite_border,
      color: accentColor,
      size: 23.0
    );
    String textpostcontent = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit nunc, scelerisque ac nulla quis, ultrices mollis justo. Fusce sed ipsum nec lorem rhoncus aliquet eu nec est. Curabitur ultricies blandit orci, id varius odio egestas ut. Duis bibendum finibus metus, ut convallis tortor consectetur in. Vestibulum sollicitudin nec nisi eu pellentesque. Morbi sed cursus dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras nisl enim, dignissim sed malesuada sit amet, tempus a justo. Praesent consequat eget risus et hendrerit. Integer consectetur ipsum dolor, at posuere nunc lobortis ac. Sed ut velit nisl. Sed feugiat nulla ligula, eu consectetur elit pharetra at. Nam tempus id arcu vel tincidunt. Praesent quis augue maximus nibh iaculis porta eu eget lacus.';
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
          margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 15),
          padding: (EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10)),
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(height: 10, thickness: 0),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RaisedButton(
                      hoverColor: currCardColor,
                      color: currCardColor,
                      onPressed: () {
                        router.navigateTo(context, "/viewpost", transition: TransitionType.fadeIn);
                      },
                      child: new Container(
                        color: currBackgroundColor,
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
                                      child: CachedNetworkImage(imageUrl: '$url', height: 30, width: 30, fit: BoxFit.cover)
                                    ),
                                    //Icon(Icons.person, color: currBackgroundColor, size: 25),
                                    //decoration: BoxDecoration(shape: BoxShape.circle, color: accentColor)),
                                    ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    new Container(
                                      height: 2.5
                                    ),
                                    Text(
                                      'Jane Doe', 
                                      style: TextStyle(fontSize: 15, color: accentColor)
                                    ),
                                    new Container(
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 1.0),
                                      child: Text(
                                          '1.3k',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(fontSize: 11.5, color: accentColor)
                                        ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8, right: 8.0),
                                      child: FloatingActionButton(
                                        child: likeButton,
                                        tooltip: 'Like this post!',
                                        mini: true,
                                        backgroundColor: currBackgroundColor,
                                        onPressed: () {
                                          setState(() {
                                            if (likeButtonNumber == 0) {
                                              likeButton = Icon(
                                                Icons.favorite,
                                                color: accentColor,
                                                size: 23.0
                                              );
                                              likeButtonNumber = 1;
                                            }
                                            else {
                                              likeButton = Icon(
                                                Icons.favorite_border,
                                                color: accentColor,
                                                size: 23.0
                                              );
                                              likeButtonNumber = 0;
                                            }
                                          });
                                        } // onPressed
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
                                          'Post Title',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(fontSize: 16, color: accentColor)
                                        ),
                                        new Container(
                                          height: 8
                                        ),
                                        Text(
                                          '$textpostcontent',
                                          textDirection: TextDirection.ltr,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12, color: accentColor)
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
                );
              })
   )
    );
  }

  void AddNewPost() {
    router.navigateTo(context, "/newpost", transition: TransitionType.fadeIn);
  }
}