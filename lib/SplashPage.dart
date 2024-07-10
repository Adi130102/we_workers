import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return FirstPage();
      },));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Image.asset("assets/Logo/AdityaLogo.png"),
              width: 250,
            ),
          ),
          // Text("We Workers",
          //     style: GoogleFonts.dancingScript(
          //       fontSize: 32,
          //     )),
        ],
      ),
    );
  }
}
