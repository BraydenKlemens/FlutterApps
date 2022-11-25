import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/models/attraction.dart';
import '../../core/models/schedule_provider.dart';

class AttractionsSchedulePage extends StatelessWidget {
  const AttractionsSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleProvider>(
      builder: (context, schedule, child) {
        List<Attraction> schedules = schedule.schedules;

        if(schedules.isNotEmpty){
          return ListView(
            children: [
              for(int i = 0; i < schedules.length; i++)
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(schedules[i].title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(schedules[i].address)
                    ],
                  ),
                )
            ],
          );
        }else {
          return const Center(child: Text("No Attractions Scheduled", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)));
        }
      }
    );
  }
}
