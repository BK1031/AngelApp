import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/utils/theme.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: currBackgroundColor,
        leading: Icon(Icons.arrow_back, color: accentColor, size: 24),
      ),
      backgroundColor: currBackgroundColor,
      body: Column(
        children: [
          Container()
        ],
      )
    );
  }
}
