import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthProvider extends ChangeNotifier {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool signedIn = false;
  User? currentUser;


  Future<String?> signUp({required String email, required String password, required String name}) async {
    try {
      var credential = await firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password
          );
      await credential.user!.updateDisplayName(name);
      await currentUser?.reload();
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
      return "Signed in!";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
  
  //SIGN OUT METHOD
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }


}