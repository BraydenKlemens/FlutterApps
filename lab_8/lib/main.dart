

import 'package:flutter/material.dart';
import './view/pages/bottom_tab_bar_scaffold.dart';
import 'package:provider/provider.dart';
import './core/models/schedule_provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScheduleProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Lab Five Part A",
        home: BottomTabBarScaffold(),
      ),
    );
  }
}
