import 'package:angel_app/pages/community/new_post_page.dart';
import 'package:angel_app/pages/home/home_page.dart';
import 'package:angel_app/pages/map/map_page.dart';
import 'package:angel_app/pages/map/place_details.dart';
import 'package:angel_app/pages/onboarding_page.dart';
import 'package:angel_app/pages/tab_bar_controller.dart';
import 'package:angel_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'utils/service_account.dart';
import 'package:fluro/fluro.dart';
import 'utils/config.dart';
import 'package:angel_app/pages/tabs/tabs_page.dart';
import 'package:angel_app/pages/profile/login_page.dart';
import 'package:angel_app/pages/profile/profile_page.dart';
import 'package:angel_app/pages/profile/sign_up_page.dart';

void main() {
  initializeApp(
      apiKey: ServiceAccount.apiKey,
      authDomain: ServiceAccount.authDomain,
      databaseURL: ServiceAccount.databaseUrl,
      projectId: ServiceAccount.projectID,
      storageBucket: ServiceAccount.storageUrl);

  // AUTH ROUTES
  router.define('/login', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new LoginPage();
  }));
  router.define('/register', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new SignUpPage();
  }));
  router.define('/profile', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ProfilePage();
  }));

  router.define('/', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new OnboardingPage();
  }));
  router.define('/app', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new TabBarController();
  }));

  // HOME ROUTES
  router.define('/home', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HomePage();
  }));

  // MAP ROUTES
  router.define('/map', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MapPage();
  }));
  router.define('/map/place/:id', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new PlaceDetailsPage(params[":id"]);
  }));

  // COMMUNITY ROUTES
  router.define('/community', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new TabsPage();
  }));

  // MESSAGES ROUTES
  router.define('/messages', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new TabsPage();
  }));
  router.define('/newpost', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new AddNewPostPage();
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
