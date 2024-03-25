// import 'package:capestone_project/Category.dart';
import 'package:flutter/material.dart';

// import 'Category.dart';
import 'Home.dart';

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
        backgroundColor: Color(0XFFedbea4),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                decoration: BoxDecoration(color: Colors.grey[200]),
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Aditya Patel",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text("pateladitya130102@gmail.com"),
                          Text("9427178733")
                        ],
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          "assets/Adi1.jpg",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
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
                            builder: (_) => categories(),
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
                            builder: (_) => categories(),
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
