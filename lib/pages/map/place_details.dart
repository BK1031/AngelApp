import 'dart:convert';
import 'dart:html';

import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

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
  var placeDetails;

  @override
  void initState() {
    super.initState();
    getPlaceDetails(id);
  }

  Future<void> getPlaceDetails(String id) async {
    var response = await get("$PROXY_URL/https://maps.googleapis.com/maps/api/place/details/json?place_id=$id&key=$MAPS_API_KEY");
    if (response.statusCode == 200) {
      // _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      //   target: LatLng(json.decode(response.body)["result"]["geometry"]["location"]["lat"], json.decode(response.body)["result"]["geometry"]["location"]["lng"]),
      //   zoom: 16,
      // )));
      setState(() {
        placeDetails = json.decode(response.body)['result'];
        print(placeDetails);
      });
    } else {
      window.alert('Failed to load place');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: currCardColor,
        title: Text("Details", style: TextStyle(color: mainColor),),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: new Column(
            children: [
              new Text(
                placeDetails != null ? placeDetails["name"] : "",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              new Padding(padding: EdgeInsets.all(4)),
              new Text(
                "Angel Rating: 4.8",
                style: TextStyle(color: accentColor, fontStyle: FontStyle.italic),
              ),
              new Padding(padding: EdgeInsets.all(4)),
              new Text(
                placeDetails != null ? placeDetails["name"] : "",
                style: TextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
