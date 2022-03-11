import 'package:flutter/material.dart';
import 'main.dart';
import 'fav_recipe_page.dart';
import 'settings_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({ Key? key }) : super(key: key);
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.blue,
            child: const Center(child: Text('Recipe App', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            height: 220
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Recipes'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.red),
            title: const Text('Favorite Recipes'),
            onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FavRecipe()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
        ],
      )
      
    );
  }
}