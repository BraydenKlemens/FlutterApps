import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/widgets/filter_complete.dart';
import '../models/survey.dart';
import '../providers/app_provider.dart';
import 'survey_screen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Surveys', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
        backgroundColor: const Color.fromARGB(255, 26, 25, 25),
      ),
      body: Consumer<AppProvider>(
        builder: (context, appState,_) {
          var surveys = appState.surveys;
          var completed = appState.completedSurveys;
          if(surveys.isNotEmpty){
            return ListView( //Make this a ListView.builder() so it only renders the surveys on screen
              children: [
                //incomplete surveys
                for(int i = 0; i < surveys.length; i++)
                  CustomListTile(survey: surveys[i], index: i),

                //Show complete surveys or not
                FilterComplete(showCompleted: appState.showCompleted),

                //Complete surveys
                if (completed.isNotEmpty)
                  for(int i = 0; i < completed.length; i++)
                    Visibility(
                      visible: appState.showCompleted,
                      child: CustomListTile(
                        survey: surveys[i],
                        index: i
                      )
                    ),
                if (completed.isEmpty && appState.showCompleted)
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('No Surveys Complete', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  )
              ],
            );
          }else{
            return const Center(
              child: Text(
                'NO SURVEYS TO COMPLETE', 
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold
                )
              )
            );
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
      padding: const EdgeInsets.all(3.0),
      child: Card(
        color: Colors.grey[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            if(!widget.survey.isCompleted){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => SurveyScreen(
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
                  child: Icon(Icons.circle_outlined, size: 30, color: Colors.blue),
                )
                : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.check_circle, size: 30, color: Colors.blue),
                ),
              Text(widget.survey.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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