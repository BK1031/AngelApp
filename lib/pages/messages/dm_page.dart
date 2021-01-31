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
  bool sender = false;
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
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
            title: Text('User Name'),
            backgroundColor: currBackgroundColor,
            actions: [
              IconButton(
                  icon: Icon(Icons.account_circle),
                  color: accentColor,
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]),
        body: FocusScope(
          node: _focusScopeNode,
          child: Column(children: [
            Expanded(
              child: Container(
                  color: currCardColor,
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) =>
                          _textMessage(messages[index], sender))),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: new TextField(
                controller: sendController,
                onSubmitted: (text) {
                  messages.add(text);
                  sendController.clear();
                  setState(() {});
                  sender = true;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Row(children: [
                      IconButton(
                          icon: Icon(Icons.send),
                          color: accentColor,
                          onPressed: () {
                            _focusScopeNode.nextFocus();
                          }),
                      IconButton(
                          icon: Icon(Icons.sentiment_satisfied_sharp),
                          color: accentColor,
                          onPressed: () {}),
                    ])),
                style: TextStyle(color: accentColor),
              ),
            )
          ]),
        )); //perhaps add something for requests
  }
}

_textMessage(String message, bool sender) {
  if (sender) {
    return Container(
        margin: EdgeInsets.only(left: 40, top: 10, bottom: 10),
        color: accentColor,
        padding: EdgeInsets.all(5),
        child: Text(message, style: TextStyle(color: currBackgroundColor)));
  } else {
    return Container(
        margin: EdgeInsets.only(top: 10, right: 40, bottom: 10),
        color: currBackgroundColor,
        child: Text(message, style: TextStyle(color: accentColor)));
  }
}
