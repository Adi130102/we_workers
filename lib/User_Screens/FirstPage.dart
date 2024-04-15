import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_workers/Technician_Screens/login.dart';
import 'package:we_workers/User_Screens/Home.dart';
import 'package:we_workers/User_Screens/UserLocation.dart';
import '../Screens/UserLogin.dart';
// import 'UserLogin.dart';
// import 'Registration.dart';
import 'package:we_workers/User_Screens/UserLogin.dart';

void main() {
  runApp(MyApp());
}

String? finalEmail;
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSessionData();
  }

  Future getSessionData() async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var obtainedSessionMail=sharedPreferences.getString(SessionEmail);
    setState(() {
      finalEmail=obtainedSessionMail;
    });
    print(finalEmail);
    print(obtainedSessionMail);
  }
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
                  print("the first page is fine + $finalEmail");
                  if (finalEmail != null && finalEmail!.isNotEmpty) {

                    // if (SessionEmail != null && SessionEmail.isNotEmpty) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        // setState(() {});
                        return Location();
                        // return UserLogin();
                      },
                    ));
                  } else {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        // setState(() {});
                        return UserLogin();
                      },
                    ));
                  }
                  setState(() {});
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
