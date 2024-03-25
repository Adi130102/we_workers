// import 'package:capestone_project/Category.dart';
import 'package:flutter/material.dart';
import 'Category.dart';

void main() {
  const MaterialApp(
    home: Location(),
  );
}

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          Icon(Icons.menu),
          SizedBox(
            width: 350,
          ),
          // Icon(Icons.notification_important),
          // SizedBox(
          //   width: 10,
          // ),
          Icon(Icons.share),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.search),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              width: 470,
              image: AssetImage("assets/images/Location.jpg"),
            ),
            SizedBox(
              height: 4,
            ),
            Icon(
              Icons.location_on,
              size: 50.0,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 500,
              height: 253,
              color: Colors.blue.shade200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Where do you want your service?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Category(),
                          ),
                        );
                      },
                      child: Text(
                        'At my current location',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Category(),
                          ),
                        );
                      },
                      child: Text(
                        'I will enter my location manually',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
