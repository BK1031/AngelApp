import 'dart:convert';
import 'package:firebase/firebase.dart' as fb;
import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NewPlaceReviewPage extends StatefulWidget {
  String id;
  NewPlaceReviewPage(this.id);
  @override
  _NewPlaceReviewPageState createState() => _NewPlaceReviewPageState(this.id);
}

class _NewPlaceReviewPageState extends State<NewPlaceReviewPage> {

  String id;
  var placeDetails;
  
  String review = "";

  bool tampon = false;
  bool angelShot = false;
  bool wellLit = false;
  bool womenOwned = false;

  bool anonymous = false;

  _NewPlaceReviewPageState(this.id);

  @override
  void initState() {
    super.initState();
    getPlaceDetails(id);
  }

  Future<void> getPlaceDetails(String id) async {
    var response = await get("$PROXY_URL/https://maps.googleapis.com/maps/api/place/details/json?place_id=$id&key=$MAPS_API_KEY");
    if (response.statusCode == 200) {
      setState(() {
        placeDetails = json.decode(response.body)['result'];
      });
    } else {
      print('Failed to load place');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: currCardColor,
        brightness: Brightness.dark,
        title: Text("New Review", style: TextStyle(color: mainColor),),
      ),
      backgroundColor: currBackgroundColor,
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(
                      placeDetails != null ? placeDetails["name"] : "",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.all(4)),
                    new Text(
                      placeDetails != null ? placeDetails["formatted_address"] : "",
                      style: TextStyle(),
                    ),
                    new Padding(padding: EdgeInsets.all(8)),
                    TextField(
                        cursorColor: accentColor,
                        maxLength: 700,
                        maxLines: null,
                        decoration: InputDecoration(
                          fillColor: currCardColor,
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Describe your experience here',
                          hintStyle: TextStyle(
                            color: accentColor,
                            fontSize: 14,
                          ),
                        )
                    ),
                    new Padding(padding: EdgeInsets.all(8)),
                    new Container(
                      child: new Text(
                        "Location Amenities",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(8)),
                    new Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new Tooltip(
                            message: "Tampons available?",
                            child: new Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(65.0))),
                              color: tampon ? mainColor : currCardColor,
                              child: new Container(
                                height: 65,
                                width: 65,
                                child: new Image.asset("images/tampon.png", color: tampon ? Colors.white : Colors.grey, height: 35, width: 35, fit: BoxFit.scaleDown),
                              ),
                            ),
                          ),
                          new Tooltip(
                            message: "Angel shot available?",
                            child: new Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(65.0))),
                              color: angelShot ? mainColor : currCardColor,
                              child: new Container(
                                height: 65,
                                width: 65,
                                child: new Image.asset("images/angel-shot.png", color: angelShot ? Colors.white : Colors.grey, height: 35, width: 35, fit: BoxFit.scaleDown),
                              ),
                            ),
                          ),
                          new Tooltip(
                            message: "Well-lit surroundings?",
                            child: new Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(65.0))),
                              color: wellLit ? mainColor : currCardColor,
                              child: new Container(
                                height: 65,
                                width: 65,
                                child: new Image.asset("images/well-lit.png", color: wellLit ? Colors.white : Colors.grey, height: 35, width: 35, fit: BoxFit.scaleDown),
                              ),
                            ),
                          ),
                          new Tooltip(
                            message: "Woman owned?",
                            child: new Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(65.0))),
                              color: womenOwned ? mainColor : currCardColor,
                              child: new Container(
                                height: 65,
                                width: 65,
                                child: new Image.asset("images/women-owned.png", color: womenOwned ? Colors.white : Colors.grey, height: 35, width: 35, fit: BoxFit.scaleDown),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(8)),
                    new SwitchListTile.adaptive(
                      title: new Text("Post this review anonymously"),
                      value: anonymous,
                      onChanged: (val) {
                        setState(() {
                          anonymous = !anonymous;
                        });
                      },
                    )
                  ],
                ),
              ),
              new Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                child: CupertinoButton(
                  onPressed: () {
                    if (review != "") {
                      fb.database().ref("places").child(id).update({
                        "tampon": tampon,
                        "angelShot": angelShot,
                        "wellLit": wellLit,
                        "womenOwned": womenOwned
                      });
                      fb.database().ref("places").child(id).child("reviews").push().set({
                        "anonymous": anonymous,
                        "author": currUser.userID,
                        "body": review,
                        "date": DateTime.now().toString()
                      });
                      router.pop(context);
                    }
                  },
                  color: currCardColor,
                  child: new Text("Post Review", style: TextStyle(fontSize: 20, color: accentColor),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
