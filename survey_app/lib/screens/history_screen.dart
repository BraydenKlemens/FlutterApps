import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import 'home_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({ Key? key }) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey History', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
        backgroundColor: const Color.fromARGB(255, 26, 25, 25),
      ),
      body: Consumer<AppProvider>(
        builder: (context, appState, child) {
          var completedsurveys = appState.completedSurveys;
          if(completedsurveys.isNotEmpty){
            return ListView(
              children: [
                for(int i = 0; i < completedsurveys.length; i++)
                  ListTile(
                    title: Text(completedsurveys[i].name)
                  )
              ],
            );
          }else{
            return const Center(child: Text('NO COMPLETIONS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
          }
        },
      )
    );
  }
}