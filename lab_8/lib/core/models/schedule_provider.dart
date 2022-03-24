import 'package:flutter/material.dart';
import 'attraction.dart';

class ScheduleProvider extends ChangeNotifier {

  List<Attraction> schedules = [];

  void addAttraction(Attraction attraction) {
    schedules.add(attraction);
    notifyListeners();
  }

}