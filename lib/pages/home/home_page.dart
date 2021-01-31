import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: currBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: new Card(
              elevation: 0,
              margin: EdgeInsets.all(15),
              color: currCardColor,
              child: Container(
                padding: EdgeInsets.only(left: 16),
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
                    style: TextStyle(color: currTextColor),
                  ),
                ),
              ),
            )),
            Padding(padding: EdgeInsets.all(5.0)),
            Text(
              '  Trending',
              style: TextStyle(
                fontSize: 30,
                color: accentColor,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 140.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: YoutubePlayerIFrame(
                        controller: YoutubePlayerController(
                            initialVideoId: 'TZEzK9q9Feo',
                            params: YoutubePlayerParams(
                              showControls: true,
                              showFullscreenButton: true,
                            )),
                      ),
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'G3X4oRv8pFg',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'Pe_Ss977srw',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'G3X4oRv8pFg',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'G3X4oRv8pFg',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Text(
              '  Personal Safety',
              style: TextStyle(
                fontSize: 30,
                color: accentColor,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 140.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'yPgPC-0QWDo',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'T7aNSRoDCmg',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'KVpxP3ZZtAc',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'jAh0cU1J5zk',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'pndPbpHLpos',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Text(
              '  Self-care',
              style: TextStyle(
                fontSize: 30,
                color: accentColor,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 140.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'h1mCVsTrvwA',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'Eupk56SG76M',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'rf1YmgeQrrI',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'dBn0ETS6XDk',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: 'yhEjeuooCy8',
                        params: YoutubePlayerParams(
                          showControls: true,
                          showFullscreenButton: true,
                        ),
                      ),
                      aspectRatio: 16 / 9,
                    ),
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: currCardColor,
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
