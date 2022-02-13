import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone/models/user.dart' as model;
import 'package:insta_clone/resources/storage_method.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  ///sign up user...
  signupUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error Occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty) {
        //This line will help us register users in firebase...
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //adding user profile pic in Firestore...
        String photoUrl = await StorageMethod()
            .uploadImageToStorage("profilePics", file, false);

        //this will return us map of user info to store in firestore...
        model.User userInfo = model.User(
          userName: userName,
          uid: cred.user!.uid,
          email: email,
          photoUrl: photoUrl,
          bio: bio,
          followers: [],
          following: [],
        );

        //Adding user info in our fireStore....
        await _fireStore.collection("users").doc(cred.user!.uid).set(
              userInfo.toJason(),
            );

        //This method will make doc itself for the user....
        // await _fireStore.collection("users").add({
        //   "username": userName,
        //   "uid": cred.user!.uid,
        //   "email": email,
        //   "bio": bio,
        //   "followers": [],
        //   "following": [],
        // });
        res = 'Sucess';
      }
    }
    // on FirebaseAuthException catch (err) {
    //   if (err.code == "invalid-email") {
    //     res = 'The email is badly formatted.';
    //   } else if (err.code == 'weak-password') {
    //     res = 'Password should be at least 6 characters.';
    //   }
    // }
    catch (err) {
      res = err.toString();
    }
    return res;
  }

  ///function for logging in the user...
  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Sucess";
      } else {
        res = "Please enter all the fields.";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
