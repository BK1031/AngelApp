import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
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
    double iconSize = 28.0;
    String textpostcontent = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elit nunc, scelerisque ac nulla quis, ultrices mollis justo. Fusce sed ipsum nec lorem rhoncus aliquet eu nec est. Curabitur ultricies blandit orci, id varius odio egestas ut. Duis bibendum finibus metus, ut convallis tortor consectetur in. Vestibulum sollicitudin nec nisi eu pellentesque. Morbi sed cursus dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras nisl enim, dignissim sed malesuada sit amet, tempus a justo. Praesent consequat eget risus et hendrerit. Integer consectetur ipsum dolor, at posuere nunc lobortis ac. Sed ut velit nisl. Sed feugiat nulla ligula, eu consectetur elit pharetra at. Nam tempus id arcu vel tincidunt. Praesent quis augue maximus nibh iaculis porta eu eget lacus.';
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        height: 60,
        width: 700,
        decoration: BoxDecoration(color: currBackgroundColor),
        
        /*child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: mainColor,
                size: iconSize
              ), 
              tooltip: 'Home',
              onPressed: () {
                router.navigateTo(context, "/home", transition: TransitionType.fadeIn);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.map_outlined,
                color: mainColor,
                size: iconSize
              ), 
              tooltip: 'Map',
              onPressed: () {
                router.navigateTo(context, "/map", transition: TransitionType.fadeIn);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.message,
                color: mainColor,
                size: iconSize
              ), 
              tooltip: 'Community',
              onPressed: null
            )
          ],
        ),
        */
        child: Column(
          children: [
            Container( // Profile + Search Bar
              alignment: Alignment.topCenter,
              padding: new EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton( // Profile
                    icon: Icon(
                      Icons.person,
                      color: accentColor,
                      size: 30
                    ), 
                    tooltip: 'Your Profile',
                    /*onPressed: () {
                      router.navigateTo(context, "/map", transition: TransitionType.fadeIn);
                    },*/
                    onPressed: null
                  ),
                  Container( // Search Bar
                    height: 40,
                    width: MediaQuery.of(context).size.width - 100,
                    alignment: Alignment.centerRight,
                    color: currCardColor,
                    child: Row(
                      children: [
                        IconButton( // Search Icon
                          icon: Icon(
                            Icons.search,
                            color: accentColor,
                            size: 30
                          ),
                          onPressed: null,
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Search for tags or topics',
                          ),
                        )
                      ],
                    )
                  )
                ],
              )
            ),
            new Container( // Community Post
              width: MediaQuery.of(context).size.width - 20,
              height: 200,
              child: Card(
                color: currBackgroundColor,
                child: Column( // Post Info
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile( // Profile + tags
                      leading: IconButton(tooltip: 'View Profile', icon: Icon(Icons.person), color: accentColor, iconSize: 30, onPressed: null),
                      title: Text(
                        'User',
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 20,
                          fontFamily: 'Times New Roman'
                        )
                      ),
                      subtitle: Text(
                        '#tag, #tag, #tag',
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 10,
                          fontFamily: 'Helvetica'
                        )
                      )
                    ),
                    new Container( // Actual Post
                      color: currCardColor,
                      width: MediaQuery.of(context).size.width - 60,
                      height: 80,
                      child: Column( // Post Content
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 15.0, bottom: 0),
                              child: new Text(
                                'Post Title',
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: 20,
                                  fontFamily: 'Helvetica'
                                )
                              ),
                            ),
                            new Container( // Divider
                              height: 9
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 0, bottom: 15.0),
                              child: new Text(
                                '$textpostcontent',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: 13,
                                  fontFamily: 'Helvetica'                                
                                )
                              ),
                            )
                          ] //column children
                        )
                      )
                  ],
                )
              ),
              
            )
          ],
        )
      )

    );
  }

  List<Widget> newMethod(BuildContext context) {
    return [
          new CupertinoButton(
            child: new Text("Go to Map"),
            color: mainColor,
            onPressed: () {
              router.navigateTo(context, "/map", transition: TransitionType.fadeIn);
            },
          ),
        ];
  }
}

/*
Widget bottomBar = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.home,
            color: Colors.pink,
            size: 24.0
          ),
          Icon(
            Icons.map_outlined,
           color: Colors.pink,
           size: 24.0
         ),
          Icon(
           Icons.message,
            color: Colors.pink,
            size: 24.0
          )
        ]
    )
);
*/
