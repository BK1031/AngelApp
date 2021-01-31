import 'package:angel_app/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  List<String> names = [
    'Jane Doe',
    'Seraphena Beckett',
    'Gabriel Merza',
    'David Waldorf',
    'Logan Huntzberger',
    'Serena van der Woodsen',
    'Abigail Thatcher',
    'Bree Springs',
    'Victoria Lawson',
    'Michelle Young',
    'Rachel Green'
  ];
  List<String> messages = [
    'weirdchamp',
    'you\'re welcome',
    'yeah it is',
    '????? they got the minneapolis police chief up in there',
    'cool cool cool',
    'JSBSHSXH SO CURE',
    'THANK U',
    'thank you ahaha',
    'that is my favorite tiktok',
    'haha no',
    'sadge',
  ];
  List<String> pics = [
    'https://randomuser.me/api/portraits/women/76.jpg',
    'https://cdn.discordapp.com/attachments/800848787467665471/805417313927036938/Thinking-of-getting-a-cat.png',
    'https://cdn.discordapp.com/attachments/800848787467665471/805417400656330832/file-20200803-24-50u91u.png',
    'https://randomuser.me/api/portraits/women/15.jpg',
    'https://randomuser.me/api/portraits/women/47.jpg',
    'https://cdn.discordapp.com/attachments/800848787467665471/805417521326063616/dog-puppy-on-garden-royalty-free-image-1586966191.png',
    'https://randomuser.me/api/portraits/women/88.jpg',
    'https://randomuser.me/api/portraits/women/8.jpg',
    'https://randomuser.me/api/portraits/men/48.jpg',
    'https://randomuser.me/api/portraits/women/62.jpg',
    'https://randomuser.me/api/portraits/men/86.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: currBackgroundColor,
        body: Container(
            margin: EdgeInsets.only(left: 15),
            padding:
                (EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 20)),
            color: currCardColor,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 10, thickness: 0),
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FlatButton(
                          onPressed: () {
                            router.navigateTo(context, "/dm",
                                transition: TransitionType.fadeIn);
                          },
                          padding: EdgeInsets.all(20),
                          color: currBackgroundColor,
                          textColor: accentColor,
                          child: Container(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(2),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: CachedNetworkImage(
                                            imageUrl: pics[index],
                                            height: 30,
                                            width: 30,
                                            fit: BoxFit.cover))),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(names[index]),
                                      Text(messages[index],
                                          style: TextStyle(fontSize: 10))
                                    ])
                              ])))
                    ],
                  );
                })));
  }
}
