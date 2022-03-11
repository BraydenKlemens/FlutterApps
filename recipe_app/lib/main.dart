import 'package:flutter/material.dart';
import 'recipes.dart';
import 'info_page.dart';
import 'navigation_drawer_widget.dart';

/*
- Use wrap with alignment Wrap Alignment instea dof rows or columns if they overfill
- Learned that everything cant just be a widget function - needs to be stateful if we want to reload only that widget
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lab Four',
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Five Part B - Brayden Klemens'),
      ),
      drawer: NavigationDrawerWidget(),

      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for(int i = 0; i < recipes.length; i++)
              BuildCard(imageURL: recipes[i]['imageUrl'], name: recipes[i]['recipeName'], author: recipes[i]['recipeAuthor'], amountIngredients: recipes[i]['amountOfIngredients'], recipeDiffiulty: recipes[i]['recipeDifficulty'],cookTime:recipes[i]['cookingTime'], time:recipes[i]['cookTime'], directions:recipes[i]['directions'], ingredients:recipes[i]['ingredients'], description: recipes[i]['description'],isFavourite: recipes[i]['isFavourite'] )
          ],
        ),
      )
    );
  }
}

//made this card interactble widget so it can change its own state
class BuildCard extends StatefulWidget {
  const BuildCard({ Key? key, required this.imageURL,required this.name, required this.author, required this.amountIngredients,required this.recipeDiffiulty,required this.cookTime, required this.time, required this.directions, required this.ingredients, required this.description, required this.isFavourite}) : super(key: key);
  final String imageURL;
  final String name;
  final String author;
  final String amountIngredients;
  final String recipeDiffiulty;
  final String cookTime;

  final List<String> ingredients;
  final List<String> directions;
  final int time;
  final String description;
  final bool isFavourite;


  @override
  _BuildCardState createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  late bool isFavourite;

  @override
  initState(){
   isFavourite = widget.isFavourite;
   super.initState();
  }

  function(value) => setState(() => isFavourite = value);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(func: function, imageURL: widget.imageURL, name:widget.name, author:widget.author, ingredients:widget.ingredients, time:widget.time,directions: widget.directions, description: widget.description, isFavourite: isFavourite)));
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: NetworkImage(widget.imageURL),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken
            ),
          )
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 5.0), child: Text(widget.name, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
                  buildCategories(widget.cookTime, widget.amountIngredients, widget.recipeDiffiulty)
                ],
              )
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(widget.author, style: const TextStyle(color: Colors.white, fontSize: 12)),
              )
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    isFavourite = !isFavourite;
                  });
                },
                child: (isFavourite == false) ? const Icon(Icons.favorite_border, color: Colors.red) : const Icon(Icons.favorite, color: Colors.red),
              )
            ),
          ],
        ),
      ),
    );
  }
}

//Builds the bottom half of the card basically the row of icon/word
Widget buildCategories(String cookTime, String amountIngredients, String recipeDifficulty){
  
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          const Icon(Icons.access_time, color: Colors.white),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(cookTime, style: const TextStyle(color: Colors.white, fontSize: 8)),
          )
        ],
      ),
      Row(
        children: [
          const Icon(Icons.shopping_bag, color: Colors.white),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(amountIngredients, style: const TextStyle(color: Colors.white, fontSize: 8)),
          )
        ],
      ),
      Row(
        children: [
          const Icon(Icons.help, color: Colors.white),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(recipeDifficulty, style: const TextStyle(color: Colors.white, fontSize: 8)),
          )
        ],
      ),
    ]
  );
}

