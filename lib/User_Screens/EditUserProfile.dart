import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_workers/User_Screens/FirstPage.dart';
import 'Registration.dart';
import 'Location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: EditUser(),
    debugShowCheckedModeBanner: false,
  ));
}

class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController Service_type = TextEditingController();
  TextEditingController Service_icon = TextEditingController();
  TextEditingController Service_description = TextEditingController();
  TextEditingController Service_price = TextEditingController();
  TextEditingController Service_isActive = TextEditingController();

  Future<void> _login() async {
    try {
      final response = await http.get(
        Uri.parse('https://awesomeworld1301.pythonanywhere.com/ServiceApiGet/'),
      );

      if (response.statusCode == 200) {
        List<dynamic> users = jsonDecode(response.body);

        bool loggedIn = users.any((user) =>
        user['email'] == Service_type.text &&
            user['passwords'] == Service_icon.text);

        if (loggedIn) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => FirstPage(),
              // builder: (_) => Location(),
            ),
          );

          print('Login successful');
        } else {
          print('Invalid email or password');
        }
      } else {
        throw Exception('Failed to load users');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Login',
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
                controller: Service_type,
                decoration: InputDecoration(
                  label: Text('Email'),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.deepPurple,
                  ),
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
                controller: Service_icon,
                decoration: InputDecoration(
                  label: Text('Password'),
                  prefixIcon: Icon(
                    Icons.password_sharp,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'Enter your Password :',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final SharedPreferences pref =
                await SharedPreferences.getInstance();
                pref.setString('email', Service_type.text);
                _login();
                setState(() {});
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decorationColor: Colors.blueAccent.shade200,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Forgot Password',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterApp(),
                        ));
                  },
                  child: Container(
                    child: Text(
                      'Dont have an account?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
