// import 'package:flutter/material.dart';
// import 'Registration.dart';
// import '../User_Screens/Location.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// void main() {
//   const MaterialApp(
//     home: TechnicianLogin(),
//     debugShowCheckedModeBanner: false,
//   );
// }
//
// class TechnicianLogin extends StatefulWidget {
//   const TechnicianLogin({super.key});
//
//   @override
//   State<TechnicianLogin> createState() => _TechnicianLoginState();
// }
//
// class _TechnicianLoginState extends State<TechnicianLogin> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   Future<void> _login() async {
//     try {
//       final response = await http.get(
//         Uri.parse(
//             'https://awesomeworld1301.pythonanywhere.com/technicianApiGet/'),
//       );
//
//       if (response.statusCode == 200) {
//         List<dynamic> users = jsonDecode(response.body);
//
//         bool loggedIn = users.any((user) =>
//             user['Technician_email'] == emailController.text &&
//             user['Technician_Password'] == passwordController.text);
//
//         if (loggedIn) {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (_) => Location(),
//             ),
//           );
//
//           print('Login successful');
//         } else {
//           print('Invalid email or password');
//         }
//       } else {
//         throw Exception('Failed to load users');
//       }
//     } catch (error) {
//       print('Error: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Technician Login',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blueGrey.shade400,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Image(
//                 image: AssetImage("assets/images/Registration.jpg"),
//                 height: 200,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               child: Text('Welcome',
//                   style:
//                       TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   label: Text('Technician_Email ID'),
//                   prefixIcon: Icon(
//                     Icons.email,
//                     color: Colors.deepPurple,
//                   ),
//                   hintText: 'Enter your Email:',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 obscureText: true,
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   label: Text('Password'),
//                   prefixIcon: Icon(
//                     Icons.password_sharp,
//                     color: Colors.deepPurple,
//                   ),
//                   hintText: 'Enter your Password :',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _login();
//                 // Navigator.of(context).push(
//                 //   MaterialPageRoute(
//                 //     builder: (_) => Location(),
//                 //   ),
//                 // );
//               },
//               child: Text(
//                 'Login',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   decorationColor: Colors.blueAccent.shade200,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               'Forgot Password',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => RegisterApp(),
//                         ));
//                   },
//                   child: Container(
//                     child: Text(
//                       'Dont have an account?',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_workers/Technician_Screens/Registration.dart';
import 'package:we_workers/User_Screens/FirstPage.dart';
// import 'Registration.dart';
// import 'Location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: TechnicianLogin(),
    debugShowCheckedModeBanner: false,
  ));
}

// Define TechnicianSessionEmail as a global static variable
const String TechnicianSessionEmail = "Technician_email";

class TechnicianLogin extends StatefulWidget {
  const TechnicianLogin({Key? key}) : super(key: key);

  @override
  State<TechnicianLogin> createState() => _TechnicianLoginState();
}

class _TechnicianLoginState extends State<TechnicianLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      final response = await http.get(
        Uri.parse('https://awesomeworld1301.pythonanywhere.com/technicianApiGet/'),
      );

      if (response.statusCode == 200) {
        List<dynamic> users = jsonDecode(response.body);

        bool loggedIn = users.any((user) =>
        user['Technician_email'] == emailController.text &&
            user['Technician_Password'] == passwordController.text);

        if (loggedIn) {
          var pref = await SharedPreferences.getInstance();
          // Use TechnicianSessionEmail here
          pref.getString(TechnicianSessionEmail);
          print("Technician Session success");
          print(pref.getString(TechnicianSessionEmail));
          setState(() {});

          // session_success();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => FirstPage(),
              // builder: (_) => Location(),
            ),
          );

          print('Technician_Login successful');
        } else {
          print('Invalid Technician_email or Technician_password');
        }
      } else {
        throw Exception('Failed to load users');
      }
    } catch (error) {
      print('Technician_Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Technician Login',
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
                controller: emailController,
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
                controller: passwordController,
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
                pref.setString('Technician_email', emailController.text);
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
