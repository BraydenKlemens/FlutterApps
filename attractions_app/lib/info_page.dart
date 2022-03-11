import 'package:flutter/material.dart';
import 'main.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key,required this.title,required this.categories,required this.description,required this.address,required this.imageURL,required this.isFree }) : super(key: key);

    final String title;
    final String description;
    final List<String> categories;
    final String address;
    final String imageURL;
    final bool isFree;

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Attraction')
      ),
      body: Stack(
        children: [
          Hero(
            tag: widget.title,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageURL),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.darken
                  ),
                ),
              ),
            ),
          ),
          ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 10),
                  Text(widget.title, style: const TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  const SizedBox(height: 30),

                  const Text('Categories', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
                  buildCategories(widget.categories),
                  const SizedBox(height: 30),

                  const Text('Description', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(widget.description, style: const TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center),
                  const SizedBox(height: 30),

                  const Text('Address', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(widget.address, style: const TextStyle(fontSize: 20, color: Colors.white)),
                  const SizedBox(height: 30),
                  
                  const Text('Cost', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
                  if (widget.isFree == true)
                    const Text('Free', style: TextStyle(fontSize: 20, color: Colors.white))
                  else
                    const Text('Not Free', style: TextStyle(fontSize: 20, color: Colors.white)),
                  const SizedBox(height: 30),

                  ButtonTheme(
                    minWidth: 200.0,
                    height: 100.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Add"),
                    ),
                  )
                ],
              ),
            ]
          ),
        ]
      ),
    );
  }
}