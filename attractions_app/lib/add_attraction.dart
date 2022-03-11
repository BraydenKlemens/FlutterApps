import 'package:flutter/material.dart';
//Big Coder gang

class AddAttraction extends StatefulWidget {
  const AddAttraction({ Key? key }) : super(key: key);

  @override
  _AddAttractionState createState() => _AddAttractionState();
}

class _AddAttractionState extends State<AddAttraction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Attraction'),
      ),
      body:const Center(
        child: Text('Add Attraction')
      )
    );
  }
}