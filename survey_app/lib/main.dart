import 'package:flutter/material.dart';
import 'history_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  List<Widget> screens = <Widget>[
    //screen objects placed here
    const ProfileScreen(name: 'Brayden'),
    const HomeScreen(),
    const HistoryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(), // standard dark theme
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'Survey Hub',
      home: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          type: BottomNavigationBarType.fixed,
          //GOOGLE: 51,55,58
          //Discord: 54, 57, 64
          backgroundColor: const Color.fromARGB(255, 26, 25, 25),
          selectedItemColor: Colors.cyan,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: (currentIndex == 0) ? const Icon(Icons.account_circle, size: 30): const Icon(Icons.account_circle_outlined, size: 30),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: (currentIndex == 1) ? const Icon(Icons.description, size: 30) : const Icon(Icons.description_outlined, size: 30),
              label: 'Surveys',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.history, size: 30),
              label: 'History',
            ),
          ],
        ),
      ),
    );
  }
}

