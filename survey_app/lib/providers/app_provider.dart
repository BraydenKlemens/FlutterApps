import 'package:flutter/material.dart';

import '../modals/my_surveys.dart';
import '../modals/survey.dart';

//create a list of surveys that will need to be populated upon user sign in
//create a seperate modal for list of objects <Survey, Completed>
//save to github, then flutterfire login, -> flutterfire configure

class AppProvider extends ChangeNotifier {

  final List<Survey> surveys = MySurveys.surveys;

  void updateSurveys(){
    
  }

}