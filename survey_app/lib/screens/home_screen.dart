import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/survey.dart';
import '../providers/app_provider.dart';
import 'survey_screen.dart';

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
            icon: const Icon(Icons.filter_alt)
          )
        ],
      ),
      body: Consumer<AppProvider>(
        builder: (context, appState, child) {
          var surveys = appState.surveys;
          if(surveys.isNotEmpty){
            return ListView(
              children: [
                for(int i = 0; i < surveys.length; i++)
                  CustomListTile(survey: surveys[i], index: i)
              ],
            );
          }else{
            return const Center(child: Text('NO SURVEYS TO COMPLETE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
          }
        },
      )
    );
  }
}

class CustomListTile extends StatefulWidget {
  
  final Survey survey;
  final int index;

  const CustomListTile({
    Key? key,
    required this.survey,
    required this.index,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 5,
        color: Colors.grey[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            if(!widget.survey.isCompleted){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => SurveyTool(
                  survey: widget.survey,
                  index: widget.index,
                )
              ));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (!widget.survey.isCompleted) 
                ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.circle_outlined, size: 30, color: Colors.cyan),
                )
                : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.check_circle, size: 30, color: Colors.cyan),
                ),
              Text(widget.survey.name, style: const TextStyle(fontSize: 20)),
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