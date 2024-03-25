import 'package:flutter/material.dart';

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
          backgroundColor: Colors.deepPurpleAccent,
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
                          setState(() {});
                        },
                        tileColor: Colors.grey[200],
                        leading: Icon(
                          Icons.edit_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: Text("Edit Profile"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      ListTile(
                        onTap: () {},
                        tileColor: Colors.grey[200],
                        leading: Icon(
                          Icons.event_note_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: Text("My bookings"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      ListTile(
                        onTap: () {},
                        tileColor: Colors.grey[200],
                        leading: Icon(
                          Icons.schedule_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: Text("Scheduled bookings"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      ListTile(
                        onTap: () {},
                        tileColor: Colors.grey[200],
                        leading: Icon(
                          Icons.star_border_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: Text("Edit Premium Membership"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      ListTile(
                        onTap: () {},
                        tileColor: Colors.grey[200],
                        leading: Icon(
                          Icons.headset_mic_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: Text("Help Center"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      ListTile(
                        onTap: () {},
                        tileColor: Colors.grey[200],
                        leading: Icon(
                          Icons.webhook_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: Text("About Us"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      ListTile(
                        onTap: () {},
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
