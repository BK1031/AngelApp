import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/utils/theme.dart';

class DmPage extends StatefulWidget {
  @override
  _DmPageState createState() => _DmPageState();
}

class _DmPageState extends State<DmPage> {
  final sendController = new TextEditingController();
  FocusScopeNode _focusScopeNode = new FocusScopeNode();
  List<String> messages = ['howdy!', 'what\'s the vibe?'];
  List<bool> sender = [false, false];
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    sendController.dispose();
    _focusScopeNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: currBackgroundColor,
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: accentColor),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Center(
                child: Text('User Name', style: TextStyle(color: accentColor))),
            backgroundColor: currBackgroundColor,
            actions: [
              IconButton(
                  icon: Icon(Icons.account_circle),
                  color: accentColor,
                  onPressed: () {})
            ]),
        body: FocusScope(
          node: _focusScopeNode,
          child: Column(children: [
            Expanded(
              child: Container(
                  color: currCardColor,
                  child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _textMessage(messages[index], sender[index]))),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: new TextField(
                controller: sendController,
                onSubmitted: (text) {
                  sender.add(true);
                  messages.add(text);
                  sendController.clear();
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: // Row(children: [
                      IconButton(
                          icon: Icon(Icons.send),
                          color: accentColor,
                          onPressed: () {
                            _focusScopeNode.nextFocus();
                          }),
                  // IconButton(
                  //     icon: Icon(Icons.sentiment_satisfied_sharp),
                  //     color: accentColor,
                  //     onPressed: () {}),
                  //])
                ),
                style: TextStyle(color: accentColor),
              ),
            )
          ]),
        )); //perhaps add something for requests
  }

  _textMessage(String message, bool sending) {
    if (sending) {
      return Container(
          margin: EdgeInsets.only(left: 40, top: 10, bottom: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8), topLeft: Radius.circular(8))),
          child: Text(message, style: TextStyle(color: currBackgroundColor)));
    } else {
      return Container(
          margin: EdgeInsets.only(top: 10, right: 40, bottom: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: currBackgroundColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  topRight: Radius.circular(8))),
          child: Text(message, style: TextStyle(color: accentColor)));
    }
  }
}
