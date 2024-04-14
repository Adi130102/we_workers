import 'package:flutter/material.dart';
import 'add-1+.dart';

void main() {
  runApp(premiumfullhomeclean());
}

class premiumfullhomeclean extends StatefulWidget {
  const premiumfullhomeclean({super.key});

  @override
  State<premiumfullhomeclean> createState() => _premiumfullhomecleanState();
}

class _premiumfullhomecleanState extends State<premiumfullhomeclean> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  child: Image.asset(
                    "assets/Expertcleaning.png",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    "Premium Full Home Cleaning",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("⭐"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          "4.5/5",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Text(
                    "Select Variant",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/premiumone.jpg",
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "1 BHK",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "₹4499",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF4f42ab)),
                                ),
                                onPressed: () {
                                  print("1 BHK Add Button printed");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            premiumfullhomecleanSecond(),
                                      ));
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/premiumtwo.jpg",
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "2 BHK",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "₹5099",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF4f42ab)),
                                ),
                                onPressed: () {
                                  print("2 BHK Add Button printed");
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/premiumthree.jpg",
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "3 BHK",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "₹5799",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF4f42ab)),
                                ),
                                onPressed: () {
                                  print("3 BHK Add Button printed");
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
