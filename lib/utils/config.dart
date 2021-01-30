import 'package:fluro/fluro.dart';
import 'package:firebase/firebase.dart' as fb;
import '../models/version.dart';

Version appVersion = new Version("1.0.0+1");
String appStatus = "";
String appFull = "Version ${appVersion.toString()}";

final router = new FluroRouter();