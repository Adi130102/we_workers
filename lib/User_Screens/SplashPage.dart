import 'dart:async';

import 'package:flutter/material.dart';
import 'package:we_workers/User_Screens/FirstPage.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

        return FirstPage();
      },));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: Center(
        child: ImageIcon(
            size: 150.0,
            AssetImage(
               'assets/Logo/Logo.jpg')),
      ),

    );
  }
}
