import 'package:flutter/material.dart';

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
      body:  const Center(child: Text('History displayed here'))
    );
  }
}