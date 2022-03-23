import 'package:flutter/material.dart';
import '../components/filter_dialog.dart';
import './add_attraction.dart';
import './attraction_list_page.dart';
import './attraction_schedule_page.dart';

import '../../core/models/attraction.dart';
import '../../core/models/guelph_attractions.dart';

class BottomTabBarScaffold extends StatefulWidget {
  @override
  State<BottomTabBarScaffold> createState() => _BottomTabBarScaffoldState();
}

class _BottomTabBarScaffoldState extends State<BottomTabBarScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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

  final List<Attraction> attractions = GuelphAttractions.guelphAttractions;
  final List<Attraction> scheduled = [];

  void updateCategories(Map<String, bool> newCategories) {
    setState(() {
      categories = newCategories;
    });
  }

  void addAttraction(Attraction attraction) {
    setState(() {
      attractions.add(attraction);
    });
  }

  void filterCategories(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return FilterDialog(
            categories: categories,
            updateCategories: updateCategories,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab 8 - Brayden Klemens"),
        actions: [
          IconButton(
            onPressed: () => filterCategories(context),
            icon: Icon(Icons.filter_list_alt),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddAttraction(
              addAttraction: addAttraction,
            )),
          );
        },
        child: Icon(Icons.add),
      ),
      body: _selectedIndex == 0
          ? AttractionListPage(
            attractions: attractions,
            categoriesToShow: categories,
          )
          : AttractionsSchedulePage(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "Attractions",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Scheduled",
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
