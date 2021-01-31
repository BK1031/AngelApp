import 'package:firebase/firebase.dart';

class User {
  String userID = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  DateTime birthday = DateTime.now();
  String profilePic = "https://icon-library.com/images/default-profile-icon/default-profile-icon-16.jpg";

  User();

  User.fromSnapshot(DataSnapshot snapshot) {
    userID = snapshot.key;
    firstName = snapshot.val()["firstName"];
    lastName = snapshot.val()["lastName"];
    email = snapshot.val()["email"];
    profilePic = snapshot.val()["profilePic"];
    birthday = DateTime.parse(snapshot.val()["birthday"]);
  }
}