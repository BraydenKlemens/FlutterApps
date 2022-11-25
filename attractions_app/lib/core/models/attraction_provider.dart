import 'package:flutter/material.dart';
import 'attraction.dart';
import 'guelph_attractions.dart';

class AttractionProvider extends ChangeNotifier {

  final List<Attraction> attractions = GuelphAttractions.guelphAttractions;

  Map<String, bool> categories = {
    "Picnic": true,
    'Playground':true,
    'Hiking':true,
    'Boating': true,
    'Ice-Cream':true,
    'Tea': true,
    'Flowers': true,
    'Swimming': true,
    'Camping': true,
    'Education':true,
  };

  Map<String, bool> categoriesCopy = {
    "Picnic": true,
    'Playground':true,
    'Hiking':true,
    'Boating': true,
    'Ice-Cream':true,
    'Tea': true,
    'Flowers': true,
    'Swimming': true,
    'Camping': true,
    'Education':true,
  };

  void update(){
    categoriesCopy.forEach((key, value) { 
     categories[key] = value;
    });
    notifyListeners();
  }

  void updateSelection(String key) {
    categoriesCopy[key] = !(categoriesCopy[key] ?? false);
    notifyListeners();
  }

  void addAttraction(Attraction attraction) {
    attractions.add(attraction);
    notifyListeners();
  }

}