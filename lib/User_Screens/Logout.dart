import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_workers/User_Screens/FirstPage.dart';
import 'package:we_workers/User_Screens/Login.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _logout(context);
          },
          child: Text('Logout'),
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
