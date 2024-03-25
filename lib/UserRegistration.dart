import 'package:flutter/material.dart';
import 'UserLogin.dart';

import 'login.dart';

void main() {
  const MaterialApp(
    home: UserRegistration(),
    debugShowCheckedModeBanner: false,
  );
}

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey.shade400,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage("assets/images/Registration.jpg"),
                height: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text('Welcome',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  label: Text('Name'),
                  prefixIcon: Icon(Icons.people_alt_outlined),
                  hintText: 'Enter your name:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Enter your Email:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  label: Text('Password'),
                  prefixIcon: Icon(Icons.password_sharp),
                  hintText: 'Enter your Password :',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => UserLogin(),
                    ),
                  );
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decorationColor: Colors.blueAccent.shade200,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
