import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/complete_survey.dart';
import '../models/my_surveys.dart';
import '../models/survey.dart';


class AppProvider extends ChangeNotifier {

  //Auth vars
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool signedIn = false;
  User? currentUser;

  //App vars
  final List<Survey> surveys = MySurveys.surveys;
  final List<CompleteSurvey> completedSurveys = [];
  bool showAuth = false;
  bool showCompleted = false;

  //Auth Functions ----------------------------------------------------------------------------------------

  //SIGN UP METHOD - all auth methods return strings for error handling
  Future<String?> signUp({required String email, required String password, required String name}) async {
    try {
      await firebaseAuth
        .createUserWithEmailAndPassword(
          email: email,
          password: password
        );
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      currentUser = FirebaseAuth.instance.currentUser;
      addUserToFireStore();
      showAuth = false;
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
      currentUser = FirebaseAuth.instance.currentUser;
      showAuth = false;
      return "Signed in!";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
  
  //SIGN OUT METHOD
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  //Firestore Functions  ---------------------------------------------------------------

  //Create a user collection on firestore
  Future<void> addUserToFireStore() {
    return FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser!.email)
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


  //REGULAR APP STATE MANAGMENT ---------------------------------------------

  void completeSurvey(int index, Survey survey){
    //update the surveys completion value
    surveys[index].isCompleted = true;
    //Add this survey to the completed list
    completedSurveys.add(
      CompleteSurvey(
        name: survey.name, 
        url: survey.url, 
        isCompleted: survey.isCompleted, 
        date: DateTime.now()
      )
    );
    notifyListeners();
  }

  //Add a regular survey
  void addSurvey(Survey survey){
    surveys.add(survey);
    notifyListeners();
  }

  //For authentication gate login / register page
  void changeAuth(){
    showAuth = !showAuth;
    notifyListeners();
  }

  void showFilter(){
    showCompleted = !showCompleted;
    notifyListeners();
  }

  void loadUserData(){
    
  }

}