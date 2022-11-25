

import 'package:flutter/material.dart';
import './view/pages/bottom_tab_bar_scaffold.dart';
import 'package:provider/provider.dart';
import './core/models/schedule_provider.dart';
import 'core/models/attraction_provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
        ChangeNotifierProvider(
          create: (context) => AttractionProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Lab Five Part A",
        home: BottomTabBarScaffold(),
      ),
    );
  }
}
