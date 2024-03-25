// import 'package:capestone_project/Location.dart';
import 'package:flutter/material.dart';
import 'Location.dart';

void main() {
  const MaterialApp(
    home: Login(),
  );
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Colors.cyan,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sign in to Continue!',
              style: TextStyle(color: Colors.blueAccent.shade200),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
              padding: const EdgeInsets.all(20.0),
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
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Location(),
                  ),
                );
              },
              child: Text('Login',
                  style: TextStyle(
                      color: Colors.blueAccent.shade400,
                      decorationColor: Colors.blueAccent)),
            )
          ],
        ));
  }
}
