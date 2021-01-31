import 'dart:convert';
import 'dart:html';
import 'package:angel_app/models/user.dart';
import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:intl/intl.dart';

class PlaceDetailsPage extends StatefulWidget {
  String id;
  PlaceDetailsPage(this.id);
  @override
  _PlaceDetailsPageState createState() => _PlaceDetailsPageState(this.id);
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {

  String id;

  _PlaceDetailsPageState(this.id);

  GoogleMapController _mapController;
  Set<Marker> _markers = Set();
  var placeDetails;

  bool tampon = false;
  bool angelShot = false;
  bool wellLit = false;
  bool womenOwned = false;

  List<Widget> reviews = [];

  @override
  void initState() {
    super.initState();
    getPlaceDetails(id);
  }

  Future<void> getPlaceDetails(String id) async {
    var response = await get("$PROXY_URL/https://maps.googleapis.com/maps/api/place/details/json?place_id=$id&key=$MAPS_API_KEY");
    if (response.statusCode == 200) {
      _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(json.decode(response.body)["result"]["geometry"]["location"]["lat"], json.decode(response.body)["result"]["geometry"]["location"]["lng"]),
        zoom: 17,
      )));
      setState(() {
        placeDetails = json.decode(response.body)['result'];
        _markers.add(Marker(
          markerId: MarkerId(id),
          position: LatLng(json.decode(response.body)["result"]["geometry"]["location"]["lat"], json.decode(response.body)["result"]["geometry"]["location"]["lng"]),
        ));
      });
    } else {
      print('Failed to load place');
    }
    fb.database().ref("places").child(id).once("value").then((value) {
      if (value.snapshot.val() != null) {
        setState(() {
          tampon = value.snapshot.val()["tampon"];
          angelShot = value.snapshot.val()["angelShot"];
          wellLit = value.snapshot.val()["wellLit"];
          womenOwned = value.snapshot.val()["womenOwned"];
        });
      }
      else {
        fb.database().ref("places").child(id).update({
          "tampon": tampon,
          "angelShot": angelShot,
          "wellLit": wellLit,
          "womenOwned": womenOwned
        });
      }
    });
    fb.database().ref("places").child(id).child("reviews").onChildAdded.listen((event) {
      fb.database().ref("users").child(event.snapshot.val()["author"]).once("value").then((value) {
        User user = new User.fromSnapshot(value.snapshot);
        setState(() {
          reviews.add(new Container(
            padding: EdgeInsets.only(bottom: 8),
            child: new Card(
              child: new Container(
                padding: EdgeInsets.all(16),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(imageUrl: user.profilePic, height: 30, width: 30, fit: BoxFit.cover)
                          ),
                        ),
                        new Padding(padding: EdgeInsets.all(4)),
                        new Text(event.snapshot.val()["anonymous"] ? "Anonymous" : user.username, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ]
                    ),
                    new Padding(padding: EdgeInsets.all(4)),
                    new Text(DateFormat("yMMMd").format(DateTime.parse(event.snapshot.val()["date"])), style: TextStyle(color: accentColor, fontStyle: FontStyle.italic)),
                    new Padding(padding: EdgeInsets.all(2)),
                    new Text(event.snapshot.val()["body"], style: TextStyle(),),
                  ],
                ),
              ),
            ),
          ));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: currCardColor,
        brightness: Brightness.dark,
        title: Text("Details", style: TextStyle(color: mainColor),),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          router.navigateTo(context, "/map/place/$id/new", transition: TransitionType.nativeModal);
        },
      ),
      backgroundColor: currBackgroundColor,
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(
                placeDetails != null ? placeDetails["name"] : "",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              new Padding(padding: EdgeInsets.all(4)),
              new Text(
                "Angel Rating: 4.8",
                style: TextStyle(fontSize: 20, color: accentColor, fontStyle: FontStyle.italic),
              ),
              new Padding(padding: EdgeInsets.all(4)),
              new Text(
                placeDetails != null ? placeDetails["formatted_address"] : "",
                style: TextStyle(),
              ),
              new Padding(padding: EdgeInsets.all(8)),
              Container(
                height: 200,
                child: new ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(target: LatLng(37.276310, -121.827484), zoom: 16),
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                      _mapController.setMapStyle(mapStyle);
                    },
                    zoomControlsEnabled: false,
                    rotateGesturesEnabled: false,
                    zoomGesturesEnabled: false,
                    scrollGesturesEnabled: false,
                    tiltGesturesEnabled: false,
                    markers: _markers,
                  ),
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
              new Container(
                child: new Text(
                  "Location Reviews",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: EdgeInsets.all(8)),
              new Container(
                child: new Column(
                  children: reviews,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
