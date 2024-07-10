import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_workers/User_Screens/FirstPage.dart';

void main(){
  runApp(MaterialApp(home: LogoutPage(),debugShowCheckedModeBanner: false,));
}
class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Are you sure you want to logout ?",style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                _logout(context);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    // Clear user session/data
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email'); // Clear email or any other stored data

    // Navigate back to the login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => FirstPage()),
      (Route<dynamic> route) => false, // Remove all routes from the stack
    );
  }
}
