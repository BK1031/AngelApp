import 'package:firebase/firebase.dart';

class User {
  String userID = "";
  String username = "";
  String email = "";
  DateTime birthday = DateTime.now();
  String profilePic = "https://icon-library.com/images/default-profile-icon/default-profile-icon-16.jpg";

  User();

  User.fromSnapshot(DataSnapshot snapshot) {
    userID = snapshot.key;
    username = snapshot.val()["username"];
    email = snapshot.val()["email"];
    profilePic = snapshot.val()["profilePic"];
    birthday = DateTime.parse(snapshot.val()["birthday"]);
  }
}