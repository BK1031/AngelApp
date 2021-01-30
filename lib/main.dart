import 'package:angel_app/pages/community/community_page.dart';
import 'package:angel_app/pages/home/home_page.dart';
import 'package:angel_app/pages/map/map_page.dart';
import 'package:angel_app/pages/onboarding_page.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'utils/service_account.dart';
import 'package:fluro/fluro.dart';
import 'utils/config.dart';

void main() {

  initializeApp(
    apiKey: ServiceAccount.apiKey,
    authDomain: ServiceAccount.authDomain,
    databaseURL: ServiceAccount.databaseUrl,
    projectId: ServiceAccount.projectID,
    storageBucket: ServiceAccount.storageUrl
  );

  // AUTH ROUTES
  router.define('/login', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new Container();
  }));
  router.define('/register', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new Container();
  }));

  // HOME ROUTES
  router.define('/', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new OnboardingPage();
  }));
  router.define('/home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HomePage();
  }));
  
  // MAP ROUTES
  router.define('/map', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MapPage();
  }));

  // MAP ROUTES
  router.define('/community', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new CommunityPage();
  }));

  runApp(new MaterialApp(
    title: "Angel",
    debugShowCheckedModeBanner: false,
    theme: mainTheme,
    color: currBackgroundColor,
    initialRoute: '/',
    onGenerateRoute: router.generator,
  ));
}