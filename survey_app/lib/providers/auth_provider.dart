import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class FirebaseProvider extends ChangeNotifier {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool signedIn = false;
  User? currentUser;


  //SIGN UP METHOD
  Future<String?> signUp({required String email, required String password, required String name}) async {
    try {
      var credential = await firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password
          );
      await credential.user!.updateDisplayName(name);
      await currentUser?.reload();
      addUserToFireStore();
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
  
  //SIGN IN METHOD
  Future<String?> signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      addUserToFireStore();
      return "Signed in!";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
  
  //SIGN OUT METHOD
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  //Create a user collection on firestore
  Future<void> addUserToFireStore() {
    return FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser!.uid)
      .set(<String, dynamic>{
        'name': currentUser!.displayName,
        'email': currentUser!.email,
        'uid': currentUser!.uid,
        'surveys': [],
        'surveyscomplete': [],
    });
  }

  //get all the surveys for a particular user
  Future<void> getSurveys() async {}

  //Load all surveys complete for a user after signing in
  Future<void> getCompletedSurveys() async {}

  //update either list of surveys on firebase
  Future<void> updateList(List<dynamic> list) async {}

  //my_surveys may be the main location for surveys
  Future<void> loadSurveysToFirebase() async {}

}