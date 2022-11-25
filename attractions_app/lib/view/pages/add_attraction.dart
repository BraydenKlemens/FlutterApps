import 'package:flutter/material.dart';
import '../../core/models/attraction.dart';

class AddAttraction extends StatefulWidget {
  final Function(Attraction) addAttraction;
  const AddAttraction({super.key, required this.addAttraction});
  @override
  State<AddAttraction> createState() => _AddAttractionState();
}

class _AddAttractionState extends State<AddAttraction> {
  bool _sliderValue = false;
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final backgroundImageController = TextEditingController();
  final categoriesController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Attraction"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCustomTextField("Attraction Title", titleController),
                _buildCustomTextField(
                    "Background Image", backgroundImageController),
                _buildCustomTextField("Categories", categoriesController),
                _buildCustomTextField("Address", addressController),
                _buildDescriptionField(),
                _buildIsFreeSwitch(),
                _buildCreateButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildCustomTextField(
      String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Padding _buildDescriptionField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Description",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          TextFormField(
            minLines: 4,
            maxLines: 6,
            controller: descriptionController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Padding _buildIsFreeSwitch() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Is Free",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Expanded(
            child: Center(
              child: Switch(
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = !_sliderValue;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildCreateButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              widget.addAttraction(
                Attraction(
                  title: titleController.text,
                  address: addressController.text,
                  categories: [categoriesController.text],
                  imageURL: backgroundImageController.text,
                  description: descriptionController.text,
                  isFree: _sliderValue,
                ),
              );
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Attraction Added')),
              );
            }
          },
          child: const Text("Create"),
        ),
      ),
    );
  }
}
