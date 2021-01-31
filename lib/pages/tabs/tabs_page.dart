import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:angel_app/pages/community/community_page.dart';
import 'package:angel_app/pages/messages/messages_page.dart';
import 'package:angel_app/pages/profile/profile_page.dart';
import 'package:fluro/fluro.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                leading: FloatingActionButton(
                  onPressed: () {
                    router.navigateTo(context, "/profile", transition: TransitionType.fadeIn);
                  },
                  child: Icon(Icons.person, color: accentColor, size: 35),
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
                      child: new TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.search, color: accentColor),
                        ),
                        style: TextStyle(color: accentColor),
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
                    tabs: [Tab(text: 'community'), Tab(text: 'messages')]),
              ),
              body:
                  TabBarView(children: [CommunityPage(), MessagesPage()]))));
  }
}
