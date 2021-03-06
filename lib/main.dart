import 'package:angel_app/pages/auth/auth_checker_page.dart';
import 'package:angel_app/pages/auth/login_page.dart';
import 'package:angel_app/pages/auth/profile_page.dart';
import 'package:angel_app/pages/auth/register_page.dart';
import 'package:angel_app/pages/community/new_post_page.dart';
import 'package:angel_app/pages/community/view_post_page.dart';
import 'package:angel_app/pages/home/home_page.dart';
import 'package:angel_app/pages/map/map_page.dart';
import 'package:angel_app/pages/map/new_place_review.dart';
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
import 'package:angel_app/pages/messages/dm_page.dart';

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
    return new RegisterPage();
  }));
  router.define('/check-auth', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        return new CheckAuthPage();
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
    return new PlaceDetailsPage(params["id"][0]);
  }));
  router.define('/map/place/:id/new', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new NewPlaceReviewPage(params["id"][0]);
  }));

  // COMMUNITY ROUTES
  router.define('/community', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new TabsPage();
  }));
  router.define('/community/new', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new AddNewPostPage();
  }));
  router.define('/community/:id', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ViewPostPage(params["id"][0]);
  }));
  // router.define('/menubar', handler: new Handler(
  //     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //   return new MenuBarPage();
  // }));

  // MESSAGES ROUTES
  router.define('/messages', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new TabsPage();
  }));
  router.define('/dm', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new DmPage();
  }));

  runApp(new MaterialApp(
    title: "Angel",
    debugShowCheckedModeBanner: false,
    theme: mainTheme,
    color: currBackgroundColor,
    initialRoute: '/check-auth',
    onGenerateRoute: router.generator,
  ));
}
