import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_provider.dart';
import 'screens/app_navigation.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        darkTheme: ThemeData.dark(), // standard dark theme
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: 'Survey Hub',
        home: const AppNavigation()
      ),
    );
  }
}

