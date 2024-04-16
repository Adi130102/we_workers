import 'package:flutter/material.dart';
import 'package:we_workers/User_Screens/TechnicianLogout.dart';

void main() {
  runApp(MaterialApp(
    home: WorkNotificationPage(),
  ));
}

class WorkNotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Work Notification',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/HelpSupport.png', // Replace with your image path
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                'The admin team will contact you when there is a work for you.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'We Thanks You, for Joining Us 🙏.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LogoutPage(),));
            }, child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
