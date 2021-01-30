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
                  leading: Container(
                    padding: EdgeInsets.all(16),
                    child: new Card(
                        color: currCardColor,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 16, top: 8, bottom: 8, right: 8),
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
                                hintText: "Search for locations",
                              ),
                              style: TextStyle(color: accentColor),
                            ),
                          ),
                        )),
                  ),
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
