import 'package:flutter/material.dart';
import 'Accepted.dart';
import 'HomePage.dart';

void main() {
  const MaterialApp(
    home: RequestPage(),
    debugShowCheckedModeBanner: false,
  );
}

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Page'),
      ),
      body: Column(children: [
        Container(
          width: 500,
          height: 80,
          color: Colors.orange,
          child: Center(
              child: Text(
            'Customer Request',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          )),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 500,
          height: 130,
          color: Colors.grey,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.people),
                    Icon(Icons.cleaning_services_outlined),
                    Icon(Icons.location_on)
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Soham Patel',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  Text(
                    'Service: Cleaning',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  Text(
                    'Swastik Society, Navrangpura',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('250'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => AcceptedService(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        'Accepted',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => HomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Declined',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 500,
          height: 130,
          color: Colors.grey,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.people),
                    Icon(Icons.cleaning_services_outlined),
                    Icon(Icons.location_on)
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Dhyey Patel',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  Text(
                    'Service: Washing',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  Text(
                    'Ritik Society, Navrangpura',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('250'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => AcceptedService(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        'Accepted',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => HomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Declined',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 500,
          height: 130,
          color: Colors.grey,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.people),
                    Icon(Icons.cleaning_services_outlined),
                    Icon(Icons.location_on)
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Aditya Patel',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  Text(
                    'Service: Electrical',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  Text(
                    'Smarty Society, Navrangpura',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('250'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => AcceptedService(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        'Accepted',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => HomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Declined',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
