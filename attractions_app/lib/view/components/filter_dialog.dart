import 'package:flutter/material.dart';
import 'package:attractions_app/core/models/attraction_provider.dart';
import 'package:provider/provider.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final Map<String, bool> categories;

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {

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
      title: const Text("Adjust Filters"),
      content: SizedBox(
        width: minSize,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              children: [
                for(var key in widget.categories.keys)
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
            Provider.of<AttractionProvider>(context, listen: false).update();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String category) {
    return GestureDetector(
      onTap: () {
        Provider.of<AttractionProvider>(context, listen: false).updateSelection(category);
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Card(
            color:
          (Provider.of<AttractionProvider>(context).categoriesCopy[category] ?? false) ? Colors.grey[300] : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(category),
            ),
          ),
          if (Provider.of<AttractionProvider>(context).categoriesCopy[category] ?? false)
            const Icon(
              Icons.check_circle,
              size: 12,
            ),
        ],
      ),
    );
  }
}
