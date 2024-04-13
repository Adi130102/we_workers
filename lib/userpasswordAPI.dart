// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
// import 'UserRegistration.dart';
// import 'UserLocation.dart';

// void main() {
//   const MaterialApp(
//     home: UserLogin(),
//     debugShowCheckedModeBanner: false,
//   );
// }

// class UserLogin extends StatefulWidget {
//   const UserLogin({super.key});

//   @override
//   State<UserLogin> createState() => _UserLoginState();
// }

// class _UserLoginState extends State<UserLogin> {
//   TextEditingController loginUsernameField = new TextEditingController();
//   TextEditingController loginPasswordField = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Login',
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
//                   TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: loginUsernameField,
//                 decoration: InputDecoration(
//                   label: Text('Username'),
//                   prefixIcon: Icon(Icons.people_alt_outlined),
//                   hintText: 'Enter your Username:',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: loginPasswordField,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   label: Text('Password'),
//                   prefixIcon: Icon(Icons.password_sharp),
//                   hintText: 'Enter your Password :',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (_) => Location(),
//                   ),
//                 );
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
//                           builder: (context) => UserRegistration(),
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



// class User {
//   // String baseURL = "http://127.0.0.1:8000/adiAPI/";
//   String baseURL = "https://awesomeworld1301.pythonanywhere.com/userAPI/";
// }