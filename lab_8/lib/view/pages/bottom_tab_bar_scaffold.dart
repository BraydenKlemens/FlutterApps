import 'package:flutter/material.dart';
import 'package:lab_8/core/models/attraction_provider.dart';
import 'package:provider/provider.dart';
import '../components/filter_dialog.dart';
import './add_attraction.dart';
import './attraction_list_page.dart';
import './attraction_schedule_page.dart';


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

  void filterCategories(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return FilterDialog(
            categories: Provider.of<AttractionProvider>(context).categories
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab 8 - Brayden Klemens"),
        actions: [
          IconButton(
            onPressed: () => filterCategories(context),
            icon: const Icon(Icons.filter_list_alt),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddAttraction(
              addAttraction: Provider.of<AttractionProvider>(context).addAttraction
            )),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: _selectedIndex == 0
          ? AttractionListPage(
            attractions: Provider.of<AttractionProvider>(context).attractions,
            categoriesToShow: Provider.of<AttractionProvider>(context).categories,
          )
          : AttractionsSchedulePage(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      items: const [
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
