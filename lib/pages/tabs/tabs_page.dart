import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/pages/community/community_page.dart';
import 'package:angel_app/pages/messages/messages_page.dart';
import 'package:angel_app/utils/theme.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                leading: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(0),
                    child: Icon(Icons.person,
                        color: currBackgroundColor, size: 25),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: currBackgroundColor)),
                elevation: 0,
                backgroundColor: currBackgroundColor,
                flexibleSpace: Column(children: [
                  Container(
                      child: new Card(
                    elevation: 0,
                    margin: EdgeInsets.only(
                        left: 50, top: 5, right: 5, bottom: 5),
                    color: currCardColor,
                    child: Container(
                      padding: EdgeInsets.only(left: 16),
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
