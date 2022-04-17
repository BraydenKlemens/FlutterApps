import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';

class FilterComplete extends StatelessWidget {
  const FilterComplete({ Key? key, required this.showCompleted }) : super(key: key);
  final bool showCompleted;

  @override
  Widget build(BuildContext context) {
    //Filter widget tree
    return UnconstrainedBox(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 60,
        width: 200,
        padding: const EdgeInsets.all(5),
        child: InkWell(
          onTap: () => Provider.of<AppProvider>(context, listen: false).showFilter(),
          child: Card(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children:[
                Padding(
                  padding: const EdgeInsets.fromLTRB(18,0,0,0),
                  child: Icon((showCompleted) ? Icons.expand_more : Icons.chevron_right),
                ),
                const Text('Completed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
        )
      ),
    );
  }
}