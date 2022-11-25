import 'package:flutter/material.dart';
import 'navigation_drawer_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 5 Part B - Brayden Klemens'),
      ),
      drawer: const NavigationDrawerWidget(),
      body:const Center(
        child: Text('Settings')
      )
    );
  }
}