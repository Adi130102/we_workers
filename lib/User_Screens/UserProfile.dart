import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_workers/User_Screens/Aboutus.dart';
import 'package:we_workers/User_Screens/EditUserProfile.dart';
import 'package:we_workers/User_Screens/HelpCenter.dart';
import 'package:we_workers/User_Screens/Logout.dart';
import 'package:we_workers/User_Screens/UserAPITrial.dart';

void main() {
  runApp(MaterialApp(
    home: UserProfileAtHome(),
    debugShowCheckedModeBanner: false,
  ));
}

class UserProfileAtHome extends StatefulWidget {
  const UserProfileAtHome({super.key});

  @override
  State<UserProfileAtHome> createState() => _UserProfileAtHomeState();
}

class _UserProfileAtHomeState extends State<UserProfileAtHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            "User Profile",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
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
                            "We Workers",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(""),
                          Text("We serve it Better !!")
                        ],
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          "assets/Logo/AdityaLogo.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.grey[200],
                  // ),
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {

                            return EditUser();
                          },));
                        },
                        tileColor: Colors.grey[200],
                        leading: Icon(
                          Icons.edit,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: Text("Edit Profile"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {

                            return AboutUsPage();
                          },));
                        },
                        tileColor: Colors.grey[200],
                        leading: Icon(
                          Icons.webhook_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: Text("About Us"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HelpSupportPage(),
                              ));
                        },
                        tileColor: Colors.grey[200],
                        leading: Icon(
                          Icons.headset_mic_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: Text("Help Center"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Trial(),
                              ));
                        },
                        tileColor: Colors.grey[200],
                        leading: Icon(
                          Icons.api_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: Text("User API Trial"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogoutPage(),
                              ));
                        },
                        tileColor: Colors.grey[200],
                        leading: Icon(
                          Icons.logout_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: Text("Logout"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
