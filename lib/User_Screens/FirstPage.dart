import 'package:flutter/material.dart';
import 'package:we_workers/Technician_Screens/login.dart';
import '../Screens/UserLogin.dart';
import 'UserLogin.dart';
// import 'Registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 90, left: 30.0, right: 30.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                '"Hello and welcome! "\n" We are delighted to have you here at"',
                style: TextStyle(
                    height: 2,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              )),
              // Text(' We are delighted to have you here at',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 10.0),),

              SizedBox(
                height: 20,
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return UserLogin();
                    },
                  ));
                },
                child: CircleAvatar(
                  radius: 100,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/User.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return TechnicianLogin();
                    },
                  ));
                },
                child: CircleAvatar(
                  radius: 100,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/tech.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
