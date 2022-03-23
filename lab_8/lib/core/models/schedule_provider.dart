import 'package:flutter/material.dart';
import 'attraction.dart';

class ScheduleProvider extends ChangeNotifier {

  List<Attraction> schedules = [];

  List<Attraction> get _schedules => schedules;

  void addAttraction(Attraction attraction) {
    schedules.add(attraction);
    notifyListeners();
  }

}