import 'package:flutter/material.dart';

class PlaceDetailsPage extends StatefulWidget {
  String id;
  PlaceDetailsPage(this.id);
  @override
  _PlaceDetailsPageState createState() => _PlaceDetailsPageState(this.id);
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  String id;

  _PlaceDetailsPageState(this.id);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
