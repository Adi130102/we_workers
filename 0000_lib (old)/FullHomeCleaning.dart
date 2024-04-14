import 'package:flutter/material.dart';
import 'PremiumHomeCleaningOne.dart';

void main() {
  runApp(FullHomeCleaning());
}

class FullHomeCleaning extends StatefulWidget {
  const FullHomeCleaning({super.key});

  @override
  State<FullHomeCleaning> createState() => _FullHomeCleaningState();
}

class _FullHomeCleaningState extends State<FullHomeCleaning> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Aditya Patel",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text("pateladitya130102@gmail.com"),
                            Text("9427178733")
                          ],
                        ),
                      ),
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                            "assets/Adi1.jpg",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset("assets/FullHomeCleaning.jpg"),
                  alignment: Alignment.center,
                ),
                SizedBox(height: 20),
                Container(
                  child: Text(
                    "Full Home Cleaning",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Classic Full Home Cleaning",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              child: Text(
                                "⭐  4.7/5",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              child: Text("For light cleaning with mop,\n"
                                  "excludes disc machine & cabinets\n"
                                  "interior cleaning"),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/ClassicFullHomeCleaning.jpeg",
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  print(
                                      "Classic Full Home Page Button is Clicked");
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Premium Full Home Cleaning",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              child: Text(
                                "⭐  4.5/5",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              child: Text("For cleaning with disc machine,\n"
                                  "recommended for move-in/out\n"
                                  "cleaning"),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/PremiumFullHomeCleaning.jpg",
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  print(
                                      "Premium Full Home Page Button is Clicked");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            premiumfullhomeclean(),
                                      ));
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Platinum Full Home Cleaning",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              child: Text(
                                "⭐  4.8/5",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              child: Text("Intense Cleaning with disc\n"
                                  "machine, includes upholstery wet\n"
                                  "washing"),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/PlatinumFullHomeCleaning.jpg",
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  print(
                                      "Platinum Full Home Page Button is Clicked");
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
