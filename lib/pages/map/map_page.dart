import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  TextEditingController _textController = new TextEditingController();
  FocusNode textFocusNode = new FocusNode();
  GoogleMapController _mapController;
  Location location = new Location();
  Set<Marker> _markers = Set();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  String locationSearchString = "";
  List<dynamic> placeList = [];
  Widget placeDetailWidget = new Container();
  bool placeSelected = false;

  @override
  void initState() {
    super.initState();
    initLocation();
    textFocusNode.addListener(() {
      setState(() {
        placeSelected = false;
        placeList.clear();
        placeDetailWidget = Container();
      });
    });
  }

  Future<void> initLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(_locationData.latitude, _locationData.longitude),
      zoom: 16,
    )));
    print("Retrieved User Location (${_locationData.latitude}, ${_locationData.longitude})");

    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
      _locationData = currentLocation;
      _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 16,
      )));
      print("Moved to (${currentLocation.latitude}, ${currentLocation.longitude})");
    });
  }

  void onSearch(String input) {
    setState(() {
      locationSearchString = input;
    });
    searchPlaces(locationSearchString.replaceAll(" ", "+"));
  }

  Future<void> searchPlaces(String query) async {
    print("Searching near (${_locationData.latitude}, ${_locationData.longitude})");
    var response = await get("$PROXY_URL/https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&location=${_locationData.latitude},${_locationData.longitude}&key=$MAPS_API_KEY");
    if (response.statusCode == 200) {
      setState(() {
        placeList = json.decode(response.body)['predictions'];
      });
    } else {
      window.alert('Failed to load predictions');
    }
  }

  Future<void> getNearestPlace(LatLng coordinates) async {
    print("Searching near (${coordinates.latitude}, ${coordinates.longitude})");
    var response = await get("$PROXY_URL/https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${coordinates.latitude},${coordinates.longitude}&radius=25&key=$MAPS_API_KEY");
    if (response.statusCode == 200) {
      setState(() {
        placeList = json.decode(response.body)['results'];
      });
      if (placeList.isNotEmpty) {
        setState(() {
          locationSearchString = "";
        });
        _textController.clear();
        textFocusNode.unfocus();
        print("Getting place details");
        getPlaceDetails(placeList[0]["place_id"]);
      }
    } else {
      window.alert('Failed to load predictions');
    }
  }

  Future<void> getPlaceDetails(String id) async {
    var response = await get("$PROXY_URL/https://maps.googleapis.com/maps/api/place/details/json?place_id=$id&key=$MAPS_API_KEY");
    if (response.statusCode == 200) {
      _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(json.decode(response.body)["result"]["geometry"]["location"]["lat"], json.decode(response.body)["result"]["geometry"]["location"]["lng"]),
        zoom: 16,
      )));
      setState(() {
        placeSelected = true;
        _markers.clear();
        _markers.add(Marker(
            markerId: MarkerId(id),
            position: LatLng(json.decode(response.body)["result"]["geometry"]["location"]["lat"], json.decode(response.body)["result"]["geometry"]["location"]["lng"]),
        ));
        placeDetailWidget = Card(
          color: currBackgroundColor,
          child: new Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                new CachedNetworkImage(imageUrl: json.decode(response.body)["result"]["icon"], color: mainColor, height: 35,),
                new Padding(padding: EdgeInsets.all(8)),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text(
                        json.decode(response.body)["result"]["name"],
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      new Padding(padding: EdgeInsets.all(4)),
                      new Text(
                        "Angel Rating: 4.8",
                        style: TextStyle(color: accentColor, fontStyle: FontStyle.italic),
                      ),
                      new Padding(padding: EdgeInsets.all(4)),
                      new Text(
                        json.decode(response.body)["result"]["formatted_address"],
                        style: TextStyle(),
                      ),
                      new Padding(padding: EdgeInsets.all(4)),
                      new CupertinoButton(
                        child: new Text("See Details", style: TextStyle(color: accentColor),),
                        color: currCardColor,
                        onPressed: () {
                          router.navigateTo(context, "/map/place/$id", transition: TransitionType.cupertino);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
    } else {
      window.alert('Failed to load place');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currBackgroundColor,
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(target: LatLng(37.276310, -121.827484), zoom: 16),
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
                _mapController.setMapStyle(mapStyle);
              },
              zoomControlsEnabled: false,
              markers: _markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              // onTap: (location) {
              //   getNearestPlace(location);
              // },
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: new Card(
                    color: currBackgroundColor,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      height: locationSearchString != "" ? 350 : 65,
                      padding: EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
                      child: Column(
                        children: [
                          Theme(
                            data: ThemeData(
                              primaryColor: accentColor,
                              accentColor: accentColor,
                              brightness: Brightness.dark,
                            ),
                            child: new TextField(
                              focusNode: textFocusNode,
                              controller: _textController,
                              onChanged: onSearch,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.search),
                                hintText: "Search for locations",
                              ),
                              cursorColor: accentColor,
                              style: TextStyle(color: accentColor),
                            ),
                          ),
                          new Visibility(
                            visible: locationSearchString != "",
                            child: new Expanded(
                              child: ListView.builder(
                                itemCount: placeList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      setState(() {
                                        locationSearchString = "";
                                      });
                                      _textController.clear();
                                      textFocusNode.unfocus();
                                      print("Getting place details");
                                      getPlaceDetails(placeList[index]["place_id"]);
                                    },
                                    title: Text(placeList[index]["structured_formatting"]["main_text"]),
                                    subtitle: Text(placeList[index]["description"]),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                ),
                new Visibility(
                  visible: placeSelected,
                  child: new Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 64),
                    child: placeDetailWidget
                  ),
                ),
                new Container(
                  child: CupertinoButton(
                    onPressed: () {

                    },
                    color: currBackgroundColor,
                    child: new Text("Tag New Location"),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}