import 'package:flutter/material.dart';

import '../modals/complete_survey.dart';
import '../modals/my_surveys.dart';
import '../modals/survey.dart';

//create a list of surveys that will need to be populated upon user sign in
//create a seperate modal for list of objects <Survey, Completed>
//save to github, then flutterfire login, -> flutterfire configure

class AppProvider extends ChangeNotifier {

  final List<Survey> surveys = MySurveys.surveys;
  final List<CompleteSurvey> completedSurveys = [];

  void completeSurvey(int index){
    surveys[index].isCompleted = true;
    notifyListeners();
  }

  void addSurvey(Survey survey){
    surveys.add(survey);
    notifyListeners();
  }

  void addToCompleted(Survey survey){
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

}