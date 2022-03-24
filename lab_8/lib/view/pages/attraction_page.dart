import 'package:flutter/material.dart';
import 'package:lab_8/core/models/schedule_provider.dart';
import '../../core/models/attraction.dart';
import 'package:provider/provider.dart';


class AttractionPage extends StatelessWidget {
  Attraction attraction;
  AttractionPage({required this.attraction});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule Attraction"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          _backgroundImage(),
          _buildBackdrop(),
          _buildAttractionContent(context),
        ],
      ),
    );
  }

  Widget _buildAttractionContent(BuildContext context) {

    return  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                attraction.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildAttractionCategories(),
              const SizedBox(
                height: 20,
              ),
              _buildAttractionDescription(),
              const SizedBox(
                height: 20,
              ),
              _buildAttractionAddress(),
              const SizedBox(
                height: 20,
              ),
              _buildAttractionCost(),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<ScheduleProvider>(context, listen: false)
                    .addAttraction(attraction);
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ),
    );
  }

  Column _buildAttractionCost() {
    return Column(
      children: [
        const Text(
          "Cost",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          attraction.isFree ? "Free" : "Not Free",
          style: const  TextStyle(
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
        const Text(
          "Address",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          attraction.address,
          style:const  TextStyle(
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
        const Text(
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
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }

  Column _buildAttractionCategories() {
    return Column(
      children: [
        const Text(
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
                    style: const TextStyle(fontSize: 18),
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
      color:const Color.fromRGBO(0, 0, 0, 0.7),
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
