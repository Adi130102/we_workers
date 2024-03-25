import 'package:flutter/material.dart';
import 'MyCart.dart';
import 'UserNotifications.dart';
import 'UserProfileAtHome.dart';
import 'FullHomeCleaning.dart';

void main() {
  runApp(MaterialApp(
    home: categories(),
    debugShowCheckedModeBanner: false,
  ));
}

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      // If "Profile" tab is clicked
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyCart()),
      );
    }
    if (index == 2) {
      // If "Profile" tab is clicked
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => notifications()),
      );
    }
    if (index == 3) {
      // If "Profile" tab is clicked
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserProfileAtHome()),
      );
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.deepPurpleAccent,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "My Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: "Notifications"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: "Profile",
            ),
          ]),
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Faculty of CA & IT",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                ),
                Container(
                  child: Text("GLS Campus, Near Law Garden......",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon:
                                Icon(Icons.search, color: Colors.deepPurple),
                            hintText: "Search for Services",
                            // hintStyle: TextStyle(fontSize: 13),
                            // suffixIcon: Icon(Icons.search),
                          ),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: IconButton(
                          color: Colors.deepPurple,
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            print("This is a Setting");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    print("Hurrey ! You will get 30% OFF ");
                  },
                  child: Container(
                    color: Colors.deepOrange[200],
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Text(
                                "Free Voucher",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 5, 5, 15),
                              child: Text(
                                  "Tap here to claim your\nfree discount vouchers.",
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Image.asset(
                              "assets/off.jpg",
                              // fit: BoxFit.cover,
                              width: 100,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text("Categories",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700)),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("You are viewing more");
                        },
                        child: Text(
                          "View More -->",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // print("Cleaning");
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      // height: 300,
                                      width: double.maxFinite,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: Text(
                                                "All Categories",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            Container(
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Bathroom Cleaning button pressed");
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/BathroomCategory.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Bathroom \nCleaning",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Full Home Cleaning Category Pressed");
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          FullHomeCleaning()));
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/premiumthree.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Full Home\n Cleaning",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Sofa & Carpet Cleaning Category Pressed");
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/SofaCategory.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Sofa & Carpet\n Cleaning",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Electric Wiring Category Pressed");
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/Wiring.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Electric \nWiring",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Electric Appliances Installation Category Pressed");
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/ElectricInstallation.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Appliances\n Installation",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Electrical Repairing Category Pressed");
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/Repairing.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Electrical\n Repairings",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Manual Cloth Washing button pressed");
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/ManualCleaning.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Manual Cloth\nCleaning",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Machine Wash Category Pressed");
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/MachineWashing.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Machine\n Wash",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Dry Cleanig Category Pressed");
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/DryClean.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Dry\n Cleaning",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Plumbing Pipelines button pressed");
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/PlumbingPipelines.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Plumbing \nPipelines",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Plumbing Installation Category Pressed");
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/PlumbingInstallationw.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Plumbing\n Installation",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              "Plumbing Repairing Category Pressed");
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                "assets/PlubmingRepairs.jpg",
                                                                height: 100,
                                                                width: 100,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "Plumbing\n Repairings",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              child: Icon(
                                Icons.grid_view_rounded,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xFF9ad0d3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Text("All"),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // print("Cleaning");
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      width: double.maxFinite,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Cleaning",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                          ),
                                          Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Bathroom Cleaning button pressed");
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/BathroomCategory.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Bathroom \nCleaning",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Full Home Cleaning Category Pressed");
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        FullHomeCleaning()));
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/premiumthree.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Full Home\n Cleaning",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Sofa & Carpet Cleaning Category Pressed");
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/SofaCategory.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Sofa & Carpet\n Cleaning",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              child: Icon(
                                Icons.cleaning_services_outlined,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xFF9ad0d3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Text("Cleaning"),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      width: double.maxFinite,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Electricals",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                          ),
                                          Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Electric Wiring Category Pressed");
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/Wiring.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Electric \Wiring",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Electric Appliances Installation Category Pressed");
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/ElectricInstallation.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Appliances\n Installation",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Electrical Repairing Category Pressed");
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/Repairing.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Electrical\n Repairings",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFF9ad0d3),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Icon(
                                Icons.electrical_services_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text("Electrical"),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // print("Dry Cleaning");
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      width: double.maxFinite,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Cloth Cleaning",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                          ),
                                          Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Manual Cloth Washing button pressed");
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/ManualCleaning.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Manual Cloth\nCleaning",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Machine Wash Category Pressed");
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/MachineWashing.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Machine\n Wash",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Dry Cleanig Category Pressed");
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/DryClean.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Dry\n Cleaning",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFF9ad0d3),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Icon(
                                Icons.dry_cleaning_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text("Clothes"),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // print("Plumber");
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      width: double.maxFinite,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Plumbing",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                          ),
                                          Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Plumbing Pipelines button pressed");
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/PlumbingPipelines.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Plumbing \nPipelines",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Plumbing Installation Category Pressed");
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/PlumbingInstallationw.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Plumbing\n Installation",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            "Plumbing Repairing Category Pressed");
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              "assets/PlubmingRepairs.jpg",
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "Plumbing\n Repairings",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              child: Icon(
                                Icons.plumbing_outlined,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xFF9ad0d3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Text("Plumbing"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Featured Product",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            print("You are Viewing more Featured Products");
                          },
                          child: Text(
                            "View More -->",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Expert Cleaning Button is Clicked");
                        },
                        child: Column(
                          children: [
                            Container(
                              child:
                                  Image.asset("assets/expertcleaningtwo.jpg"),
                              height: 150,
                              width: 150,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "Expert Cleaning",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              child: const Text("⭐⭐⭐⭐⭐"),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Expert Electrician is Clicked");
                        },
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset("assets/electricone.jpg"),
                              height: 150,
                              width: 150,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "Expert Electrician",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              child: Text("⭐⭐⭐⭐⭐"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
