import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Category(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<String> popularCategories = [
    'Beautician',
    'Electrician',
    'Professional Cleaning',
  ];

  final List<String> allCategories = [
    'Ac Repair & Service',
    'Bathroom Cleaning Subscription',
    'CCTV',
    'Carpenter',
    'Washing Machine Repair',
    'Plumber',
    'Tv Repair',
    'Skin Hair Treatments',
    'Refrigerator Repair',
    'Nail Artist',
    'Smart Locks',
    'RO Water Purifier Repair'
  ];

  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.location_on), // Location icon
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('GLS HAPPY',
                        style: TextStyle(fontSize: 16)), // Display name
                    Text('Street, Law Garden',
                        style: TextStyle(fontSize: 12)), // Display address
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person), // User icon
                ),
                SizedBox(width: 10),
                Text('User Name',
                    style: TextStyle(fontSize: 16)), // Display user name
              ],
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'What do you do?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 40,
              child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              'Popular Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: popularCategories.map((category) {
              return ListTile(
                leading: _getIconForCategory(category),
                title: Text(category),
                trailing: Checkbox(
                  value: selectedCategories.contains(category),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value ?? false) {
                        selectedCategories.add(category);
                      } else {
                        selectedCategories.remove(category);
                      }
                    });
                  },
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              'All Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allCategories.length,
              itemBuilder: (BuildContext context, int index) {
                String category = allCategories[index];
                return CheckboxListTile(
                  title: Text(category),
                  value: selectedCategories.contains(category),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value ?? false) {
                        selectedCategories.add(category);
                      } else {
                        selectedCategories.remove(category);
                      }
                    });
                  },
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => HomePage(),
                  ),
                );
              },
              child: Text("Proceed to Continue"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getIconForCategory(String category) {
    switch (category) {
      case 'Beautician':
        return Icon(Icons.face);
      case 'Electrician':
        return Icon(Icons.flash_on);
      case 'Professional Cleaning':
        return Icon(Icons.cleaning_services);
      default:
        return Icon(Icons.category);
    }
  }
}
