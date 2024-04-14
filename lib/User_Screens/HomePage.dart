// import 'package:capestone_project/RequestPage.dart';
import 'package:flutter/material.dart';
import 'RequestPage.dart';

void main() {
  const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.people_sharp),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Workers Name'),
                  SizedBox(
                    width: 200,
                  ),
                  Icon(Icons.notification_add_outlined)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            label: Text('Search'),
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search for service here!",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(Icons.cancel_rounded)
                  ],
                ),
              ),
              Container(
                width: 500,
                height: 50,
                color: Colors.blue,
                child: Center(
                    child: Text(
                  'Welcome to our Workers Family',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.orangeAccent.shade200,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => RequestPage(),
                                ),
                              );
                            },
                            child: Text('Customer Request',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 180,
                        height: 200,
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => HomePage(),
                                ),
                              );
                            },
                            child: Text('Todays Schedule',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.orange,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => HomePage(),
                              ),
                            );
                          },
                          child: Text('Your Wallet',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 180,
                      height: 200,
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => HomePage(),
                              ),
                            );
                          },
                          child: Text('Check Reviews',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.pending),
                      Icon(Icons.home_filled),
                      Icon(Icons.notification_important),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
