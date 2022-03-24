import 'package:flutter/material.dart';
import 'attraction.dart';
import 'guelph_attractions.dart';

class AttractionProvider extends ChangeNotifier {

  final List<Attraction> attractions = GuelphAttractions.guelphAttractions;

  Map<String, bool> categories = {
    "Picnic": true,
    'Playground':true,
    'hiking':true,
    'Boating': true,
    'Ice-Cream':true,
    'Tea': true,
    'Flowers': true,
    'Swimming': true,
    'Camping': true,
    'Education':true,
  };


  void addAttraction(Attraction attraction) {
    attractions.add(attraction);
    notifyListeners();
  }

  void updateCategories(Map<String, bool> newCategories) {
    categories = newCategories;
    notifyListeners();
  }

}