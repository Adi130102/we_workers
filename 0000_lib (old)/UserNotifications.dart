import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: notifications(),
    debugShowCheckedModeBanner: false,
  ));
}

class notifications extends StatefulWidget {
  const notifications({super.key});

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications 🔔"),
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Text("Notifications are under construction 😉"),
        ),
      ),
    );
  }
}
