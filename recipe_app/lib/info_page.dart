import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key,required this.func, required this.imageURL,required this.name,required this.author,required this.ingredients, required this.time,required this.directions,required this.description, required this.isFavourite}) : super(key: key);
    final String name;
    final String description;
    final List<String> ingredients;
    final List<String> directions;
    final String author;
    final String imageURL;
    final int time;
    final bool isFavourite;
    final Function func;

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late bool isFavourite;

  @override
  initState(){
   isFavourite = widget.isFavourite;
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavourite = !isFavourite;
                widget.func(isFavourite);
              });
            },
            icon: (isFavourite == true) ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_outline, color: Colors.red)
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 220,
            child: Image.network(widget.imageURL, fit: BoxFit.cover,)
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: [
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Author: ', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                    Text(widget.author, style: const TextStyle(fontSize: 20), textAlign: TextAlign.left)
                  ],
                ),
                const SizedBox(height: 20),

                const Text('Description:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                Text(widget.description, style: const TextStyle(fontSize: 20), textAlign: TextAlign.left),
                const SizedBox(height: 20),


                const Text('Ingredients', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
                Wrap(
                  children: [
                    for(int i = 0; i < widget.ingredients.length; i++)
                      Text('${i+1}. ${widget.ingredients[i]}  ', style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
                  ],
                ),
                const SizedBox(height: 20),

                const Text('Time to Cook:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                Text('${widget.time} mins', style: const TextStyle(fontSize: 20), textAlign: TextAlign.left),
                const SizedBox(height: 20),

                const Text('Directions:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for(int i = 0; i < widget.directions.length; i++)
                      Text('${i+1}. ${widget.directions[i]}', style: const TextStyle(fontSize: 20), textAlign: TextAlign.left),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            )
          )
        ],
      ), 
    );
  }
}