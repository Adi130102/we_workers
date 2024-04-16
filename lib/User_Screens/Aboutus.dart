import 'package:flutter/material.dart';

void main() {
  runApp(AboutUsApp());
}

class AboutUsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutUsPage(),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/Logo/Logo.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Our Company',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Our company provides high-quality'
                    ' services to help you maintain a clean and organized space and tension free life. '
                    'Whether it\'s residential services, office services, '
                    'or any other services needs, our skilled workers are '
                    'dedicated to delivering exceptional service.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('pateladitya130102@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+91 9427178733'),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
