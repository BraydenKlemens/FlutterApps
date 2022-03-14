import 'package:flutter/material.dart';
import 'attractions.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormBuilderState>();

  String? _validatorFunc(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //All form feilds using a form builder to submit input
              const Text("Attraction Title", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              FormBuilderTextField(
                name: 'title',
                validator: _validatorFunc,
                style: const TextStyle(fontSize: 18)
              ),
              const SizedBox(height: 60),

              const Text("Background Image", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              FormBuilderTextField(
                name: 'imageURL',
                validator: _validatorFunc
              ),
              const SizedBox(height: 60),

              const Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              FormBuilderTextField(
                name: 'categories',
                validator: _validatorFunc
              ),
              const SizedBox(height: 60),

              const Text("Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              FormBuilderTextField(
                name: 'address',
                validator: _validatorFunc
              ),
              const SizedBox(height: 60),

              const Text("Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              FormBuilderTextField(
                maxLines: 4,
                name: 'description',
                validator: _validatorFunc
              ),
              const SizedBox(height: 60),

              Padding(//This is pointless but for the style of the lab
                padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                child: FormBuilderSwitch(
                  name: 'isFree',
                  title: const Text("Is Free", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  decoration: const  InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 60),

              //Submit button a the bottom
              Center(
                child: ButtonTheme(
                  minWidth:200.0,
                  height: 200.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      //Could update filter here based on the new filters added (check if its there)
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Attraction Added')),
                        );
                        final formData = _formKey.currentState?.value;
                        final obj = {
                          "title": formData!['title'],
                          "categories": [formData['categories'].toString()],
                          "address": formData['address'],
                          "imageURL": formData['imageURL'],
                          "isFree": formData['isFree'],
                          "description": formData['description'],
                        };
                        attractions.add(obj);
                        _formKey.currentState?.reset();
                      }
                    },
                    child: const Text('Create'),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}