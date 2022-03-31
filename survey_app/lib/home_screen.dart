import 'package:flutter/material.dart';
import 'survey_tool.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Surveys', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
        backgroundColor: const Color.fromARGB(255, 26, 25, 25),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt))
        ],
      ),
      body: ListView(
        children: [
          for(int i = 0; i < 6; i++)
            const CustomListTile()
        ],
      )
    );
  }
}

class CustomListTile extends StatefulWidget {
  const CustomListTile({ Key? key}) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const SurveyTool(
                survey_url: 'https://uoguelph.eu.qualtrics.com/jfe/form/SV_0dYKo3NuYi1oVpk')));
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isSelected)
                IconButton(
                  icon: const Icon(Icons.circle_outlined, size: 30, color: Colors.cyan),
                  onPressed: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                )
              else
                IconButton(
                  icon: const Icon(Icons.check_circle, size: 30, color: Colors.cyan),
                  onPressed: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ),
              const Text('Survey 1', style: TextStyle(fontSize: 20)),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.navigate_next),
              )
            ],
          ),
        )
      )
    );
  }
}