import 'package:flutter/material.dart';
import 'navigation_drawer_widget.dart';

class FavRecipe extends StatefulWidget {
  const FavRecipe({ Key? key }) : super(key: key);

  @override
  _FavRecipeState createState() => _FavRecipeState();
}

class _FavRecipeState extends State<FavRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 5 Part B - Brayden Klemens'),
      ),
      drawer: NavigationDrawerWidget(),
      body:const Center(
        child: Text('Favourite Recipes')
      )
    );
  }
}