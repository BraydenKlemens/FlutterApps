import 'package:flutter/material.dart';

import '../models/complete_survey.dart';
import '../models/my_surveys.dart';
import '../models/survey.dart';

//create a list of surveys that will need to be populated upon user sign in
//create a seperate modal for list of objects <Survey, Completed>
//save to github, then flutterfire login, -> flutterfire configure

class AppProvider extends ChangeNotifier {

  final List<Survey> surveys = MySurveys.surveys;
  final List<CompleteSurvey> completedSurveys = [];

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

  void addSurvey(Survey survey){
    surveys.add(survey);
    notifyListeners();
  }
}