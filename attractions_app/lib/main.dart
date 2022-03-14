import 'package:flutter/material.dart';
import 'attractions.dart';
import 'filters.dart';
import 'add_attraction.dart';
import 'info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lab Seven',
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int currentIndex = 0;
   bool tapped = false;
   bool apply = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 7 - Brayden Klemens'),
        actions: [
          IconButton(
            onPressed: () {
              openDialog();
            },
            icon: const Icon(Icons.filter_alt))
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          ListView(
            children: [
              for(int i = 0; i < attractions.length; i++)
                buildAttraction(attractions[i]['title'], attractions[i]['isFree'], attractions[i]['imageURL'],attractions[i]['address'], attractions[i]['categories'], attractions[i]['description'])
            ],
          ),
          const Center(child: Text('Schedule Page')),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAttraction())).then((_) => setState(() {}));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amberAccent[700],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Attractions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Scheduled',
          ),
        ],
      ),
    );
  }


  Future openDialog() => showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => WillPopScope(
        onWillPop: () { //for when users click off screen it resets the filter values to false
          for(int i = 0; i < filters.length; i++){
            filters[i]['isTapped'] = false;
          }
          return Future.value(true);
        },
        child: AlertDialog(
          title: const Text('Adjust Filters'),
          actions: [
            TextButton(
              child: const Text('Apply', style: TextStyle(fontSize: 18)),
              onPressed: () {
                //Filters update thier state, but setState here refreshes the changes to thier array values
                Navigator.of(context).pop();
                this.setState(() {});
              },
            )
          ],
          content: SizedBox(
            width: 500,
            child: Wrap(
              children: [ 
                for(int i = 0; i < filters.length; i++)
                  //returned values from Filter update the array of filters values
                  Filter(category: filters[i]['name'], tapped: filters[i]['isTapped'], func: (value) => setState(() => filters[i]['isTapped'] = value))
              ],
            ),
          ),
        ),
      ),
    )
  );

  Widget buildAttraction(String title, bool isFree, String image, String address, List<String> categories, String description){

    IconData free = Icons.attach_money;
    IconData cost = Icons.money_off;
    bool visible = true;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    //Dont display the attraction if it includes a filter
    for(int i = 0; i < categories.length; i++){
      for(int j = 0; j < filters.length; j++){
        if(categories[i] == filters[j]['name']){
          if(filters[j]['isTapped'] == true){
            visible = false;
          }
        }
      }
    }
    
    return Visibility(
      visible: visible,
      child: Container(
        padding: (height > width) ? const EdgeInsets.all(20.0) : const EdgeInsets.fromLTRB(270, 20, 270, 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Hero(
                tag: title,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(title: title, categories: categories, description: description, address: address, imageURL: image, isFree: isFree)));
                  },
                  child: SizedBox(width: 360, height:250, child: Image.network(image, fit: BoxFit.fill))
                ),
              ),
              buildCategories(categories),
              Text(address, style: const TextStyle(fontSize: 18)),
              if (isFree == true)//money_off
                Icon(cost, size: 30)
              else
                Icon(free, size: 30)
            ],
          )
        ),
      ),
    );
  }
}

Widget buildCategories(List<String> categories){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for(int i = 0; i < categories.length; i++)
        SizedBox(
          height: 40,
          child: Card(
            margin: const EdgeInsets.all(5.0),
            child: Padding(padding: const EdgeInsets.all(5.0), child: Center(child: Text(categories[i], style: const TextStyle(fontSize: 18)))),
          ),
        ),
    ],
  );
}

class Filter extends StatefulWidget {
  const Filter({ Key? key, required this.category, required this.tapped, required this.func}) : super(key: key);
  final String category;
  final bool tapped;
  final Function func;
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  late bool tapped;
  late Function func;
  List<int> indexes =[];

  @override
  void initState() {
    tapped = widget.tapped;
    func = widget.func;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  UnconstrainedBox(
      child: SizedBox(
        height: 40,
        child: GestureDetector(
          onTap:() {
            setState(() {
              //return the new value of the filter
              tapped = !tapped;
              func(tapped);
            });
          },
          child: Card(
            color: (tapped == false) ? Colors.grey[350] : Colors.white,
            margin: const EdgeInsets.all(5.0),
            child: Row(
              children: [ 
                Padding(padding: const EdgeInsets.all(5.0), child: Center(child: Text(widget.category, style: const TextStyle(fontSize: 15)))),
                Align(
                  alignment: Alignment.topRight,
                  child: (tapped == false) ? const Icon(Icons.check_circle, size: 15) : const Padding(padding: EdgeInsets.all(0.0))
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
