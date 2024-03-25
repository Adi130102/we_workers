import 'package:flutter/material.dart';
import 'UserLogin.dart';
import 'Registration.dart';

void main() {
  const MaterialApp(
    home: FirstPage(),
    debugShowCheckedModeBanner: false,
  );
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: Text(
          'We Workers',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 500.0,
            height: 200.0,
            child: Center(
                child: Text(
              'Technician',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.black,
                  fontSize: 30.0),
            )),
            decoration: BoxDecoration(
              color: Colors.pinkAccent.shade100,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Registration(),
                  ),
                );
              },
              icon: Icon(
                Icons.pan_tool_alt_sharp,
                color: Colors.blueAccent.shade400,
              ),
              label: Text(
                "Technician",
                style: TextStyle(color: Colors.blue.shade400),
              )),
          SizedBox(height: 20),
          Container(
              width: 500.0,
              height: 200.0,
              child: Center(
                  child: Text(
                'User',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0),
              )),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                shape: BoxShape.circle,
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => UserLogin(),
                  ),
                );
              },
              icon: Icon(
                Icons.person,
                color: Colors.pinkAccent.shade400,
              ),
              label: Text(
                "User",
                style: TextStyle(color: Colors.pinkAccent),
              )),
        ],
      ),
    );
  }
}
