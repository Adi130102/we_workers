// // import 'package:capestone_project/HomePage.dart';
// import 'package:flutter/material.dart';
// import 'HomePage.dart';
//
// void main() {
//   const MaterialApp(
//     home: Payment(),
//     debugShowCheckedModeBanner: false,
//   );
// }
//
// class Payment extends StatefulWidget {
//   const Payment({super.key});
//
//   @override
//   State<Payment> createState() => _PaymentState();
// }
//
// class _PaymentState extends State<Payment> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Payment Page"),
//       ),
//       body: Column(
//         children: [
//           Center(child: Text('Payment')),
//           SizedBox(
//             height: 30,
//           ),
//           Center(
//               child: Image(
//                   width: 300, image: AssetImage("assets/images/Payment.jpg"))),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (_) => HomePage(),
//                   ),
//                 );
//               },
//               child: Text("OR CODE"))
//         ],
//       ),
//     );
//   }
// }
