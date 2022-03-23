import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({
    Key? key,
    required this.categories,
    required this.updateCategories,
  }) : super(key: key);

  final Map<String, bool> categories;
  final Function(Map<String, bool>) updateCategories;

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  Map<String, bool> categories_copy = {};

  @override
  void initState() {
    super.initState();

   widget.categories.forEach((key, value) { 
     categories_copy[key] = value;
   });

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double minSize;
      if (width < height) {
        minSize = width;
      } else {
        minSize = height;
      }
    return AlertDialog(
      title: Text("Adjust Filters"),
      content: Container(
        width: minSize,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              children: [
                for(var key in categories_copy.keys)
                  _buildCategoryCard(key)
                  
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Apply'),
          onPressed: () {
            widget.updateCategories(categories_copy);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          categories_copy[category] = !(categories_copy[category] ?? false);
        });
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Card(
            color:
          (categories_copy[category] ?? false) ? Colors.grey[300] : Colors.white,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(category),
            ),
          ),
          if (categories_copy[category] ?? false)
            Icon(
              Icons.check_circle,
              size: 12,
            ),
        ],
      ),
    );
  }
}
