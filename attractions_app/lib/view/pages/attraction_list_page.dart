import 'package:flutter/material.dart';
import '../../core/models/attraction.dart';
import '../components/attraction_card.dart';

class AttractionListPage extends StatelessWidget {
  final List<Attraction> attractions;
  final Map<String, bool> categoriesToShow;
  const AttractionListPage({super.key, 
    required this.categoriesToShow,
    required this.attractions,
  });

  bool isShown(Attraction attraction) {
    bool val = true;
    for (var element in attraction.categories) {
      if (categoriesToShow[element] == false) {
        val = false;
      }
    }

    return val;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;

      double minSize;
      if (width < height) {
        minSize = width;
      } else {
        minSize = height;
      }
      return Center(
        child: SizedBox(
          width: minSize,
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (isShown(attractions[index])) {
                return AttractionCard(
                  index: index,
                  attractions: attractions,
                );
              } else {
                return Container();
              }
            },
            itemCount: attractions.length,
          ),
        ),
      );
    });
  }
}
