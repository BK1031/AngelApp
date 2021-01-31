import 'package:angel_app/models/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:angel_app/pages/community/community_page.dart';
import 'package:angel_app/pages/messages/messages_page.dart';
import 'package:fluro/fluro.dart';

class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  router.navigateTo(context, "/profile", transition: TransitionType.fadeIn);
                },
                child: ClipRRect(borderRadius: BorderRadius.circular(35), child: CachedNetworkImage(imageUrl: User().profilePic, height: 35, width: 35, fit: BoxFit.cover,)),
                backgroundColor: currBackgroundColor,
              ),
              elevation: 0,
              backgroundColor: currBackgroundColor,
              flexibleSpace: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: new Card(
                          elevation: 0,
                          margin: EdgeInsets.only(
                              left: 60, top: 5, right: 10, bottom: 20),
                          color: currCardColor,
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Theme(
                              data: ThemeData(
                                primaryColor: accentColor,
                                accentColor: accentColor,
                                brightness: Brightness.dark,
                              ),
                              child: new TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.search),
                                  hintText: "Search",
                                ),
                                cursorColor: accentColor,
                                style: TextStyle(color: accentColor),
                              ),
                            ),
                          ),
                        ))
                  ]),
              bottom: TabBar(
                  indicator: BoxDecoration(
                    color: currCardColor,
                    border: Border(
                        left: BorderSide(width: 2, color: accentColor),
                        top: BorderSide(width: 2, color: accentColor),
                        right: BorderSide(width: 2, color: accentColor)),
                  ),
                  labelColor: accentColor,
                  tabs: [Tab(text: 'Community'), Tab(text: 'Messages')]),
            ),
            body:
            TabBarView(children: [CommunityPage(), MessagesPage()])));
  }
}
