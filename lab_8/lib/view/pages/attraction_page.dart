import 'package:flutter/material.dart';

import '../../core/models/attraction.dart';

class AttractionPage extends StatelessWidget {
  Attraction attraction;
  AttractionPage({required this.attraction});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule Attraction"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          _backgroundImage(),
          _buildBackdrop(),
          _buildAttractionContent(),
        ],
      ),
    );
  }

  Widget _buildAttractionContent() {
    return  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                attraction.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _buildAttractionCategories(),
              SizedBox(
                height: 20,
              ),
              _buildAttractionDescription(),
              SizedBox(
                height: 20,
              ),
              _buildAttractionAddress(),
              SizedBox(
                height: 20,
              ),
              _buildAttractionCost(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  //Here is where I will use provider for the new task
                  //It should just send data to the schedule page
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
    );
  }

  Column _buildAttractionCost() {
    return Column(
      children: [
        Text(
          "Cost",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          attraction.isFree ? "Free" : "Not Free",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Column _buildAttractionAddress() {
    return Column(
      children: [
        Text(
          "Address",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          attraction.address,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Column _buildAttractionDescription() {
    return Column(
      children: [
        Text(
          "Description",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          attraction.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }

  Column _buildAttractionCategories() {
    return Column(
      children: [
        Text(
          "Categories",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          textAlign: TextAlign.start,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < attraction.categories.length; i++)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    attraction.categories[i],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildBackdrop() {
    return Container(
      color: Color.fromRGBO(0, 0, 0, 0.7),
      width: double.infinity,
    );
  }

  Hero _backgroundImage() {
    return Hero(
      tag: attraction.title,
      child: Image.network(
        attraction.imageURL,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
