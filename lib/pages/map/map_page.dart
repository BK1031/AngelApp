import 'dart:async';

import 'package:angel_app/utils/config.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Completer<GoogleMapController> _mapController = Completer();
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  @override
  void initState() {
    super.initState();
    initLocation();
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
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(_locationData.latitude, _locationData.longitude),
      zoom: 16,
    )));
    print("Retrieved User Location (${_locationData.latitude}, ${_locationData.longitude})");

    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 16,
      )));
      print("Moved to (${currentLocation.latitude}, ${currentLocation.longitude})");
    });
  }

  void onSearch(String input) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(target: LatLng(37.276310, -121.827484), zoom: 16),
              onMapCreated: (GoogleMapController controller) {
                _mapController.complete(controller);
                controller.setMapStyle(mapStyle.toString());
              },
              zoomControlsEnabled: false,
            ),
            new Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: new Card(
                    color: currCardColor,
                    child: Container(
                      padding: EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
                      child: Theme(
                        data: ThemeData(
                          primaryColor: accentColor,
                          accentColor: accentColor,
                          brightness: Brightness.dark,
                        ),
                        child: new TextField(
                          onChanged: onSearch,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                            hintText: "Search for locations",
                          ),
                          style: TextStyle(color: accentColor),
                        ),
                      ),
                    )
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