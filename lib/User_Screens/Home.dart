import 'package:flutter/material.dart';
import 'package:we_workers/User_Screens/AllServices.dart';
import 'package:we_workers/User_Screens/MyCart.dart';
import 'GlobalClass.dart';
import 'UserNotifications.dart';
import 'UserProfileAtHome.dart';

void main() {
  runApp(const MaterialApp(
    home: Categories(),
    debugShowCheckedModeBanner: false,
  ));
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 1) {
        // If "My Cart" tab is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyCart(cartItems: GlobalLocation.AdityacartItems)),
        ).then((value) {
          setState(() {
            selectedIndex = 0;
          });
        });
      }
      if (index == 2) {
        // If "Notifications" tab is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => notifications()),
        ).then((value) {
          setState(() {
            selectedIndex = 0;
          });
        });
        ;
      }
      if (index == 3) {
        // If "Profile" tab is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserProfileAtHome()),
        ).then((value) {
          setState(() {
            selectedIndex = 0;
          });
        });
        ;
      }
    });
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
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined,size: 40,color: Colors.deepPurple,),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text( GlobalLocation.Address,
                            style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.deepPurple)),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   child: Text("GLS Campus, Near Law Garden......",
                //       style:
                //           TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                // ),
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
                        child: Text("Services",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoriesAll(),
                              ));
                          // print("You are viewing more");
                        },
                        child: Container(
                          child: Text(
                            "View More -->",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
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
                  height: 40,
                  width: double.maxFinite,
                  color: Color(0xFF9ad0d3),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoriesAll(),
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text("All Services",style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
                          width: double.maxFinite,
                          height: 40,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoriesAll(),
                                ));
                            // print("You are Viewing more Featured Products");
                          },
                          child: Container(
                            child: Text(
                              "View More -->",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
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
