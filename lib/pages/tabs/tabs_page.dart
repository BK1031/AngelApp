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
                  elevation: 0,
                  backgroundColor: currBackgroundColor,
                  flexibleSpace: Column(children: [
                    Container(
                        child: new Card(
                      elevation: 0,
                      color: currCardColor,
                      child: Container(
                        padding: EdgeInsets.only(left: 16),
                        child: new TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
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
