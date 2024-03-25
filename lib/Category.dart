import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  const MaterialApp(
    home: Category(),
    debugShowCheckedModeBanner: false,
  );
}

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User Name', style: TextStyle(fontSize: 16)),
                Text('GLS HAPPY', style: TextStyle(fontSize: 16)),
                Text('STREET, LAW GARDEN', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'What do you do?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
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
          Expanded(
            child: ListView.builder(
              itemCount: allCategories.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == allCategories.length) {
                  return DropdownButtonFormField<String>(
                    items: allCategories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? value) {},
                  );
                } else {
                  String category = allCategories[index];
                  return CheckboxListTile(
                    title: Text(category),
                    value: false,
                    onChanged: (bool? value) {},
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
            child: Text(
              'All Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
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
                child: Text("Proceed to Continue")),
          )
        ],
      ),
    );
  }
}
