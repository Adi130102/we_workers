import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'UserPayment.dart';

void main() {
  runApp(MaterialApp(
    home: MyCart(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int item = 1;
  int price = 4499;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    total = item * price;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text("Deliver to : "),
                          ),
                          Container(
                            child: Text("Room-204, Damubhai Viyarthi...."),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          print("Want to change Address");
                        },
                        child: Text(
                          "Change",
                          style: TextStyle(color: Colors.deepPurpleAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                // margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              ),
                          child:
                              Image.asset("assets/PremiumFullHomeCleaning.jpg"),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          width: 105,
                          height: 30,
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  item--;
                                  setState(() {});
                                },
                                child: Icon(Icons.remove),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(22, 22),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 2),
                                    shape: LinearBorder()),
                              ),
                              Container(
                                width: 8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Text(
                                  item.toString(),
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  item++;
                                  setState(() {});
                                },
                                child: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(22, 22),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 2),
                                    shape: LinearBorder()),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "Premium Full Home Cleaning",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                  "For Cleaning with disc machine, for move-in/out cleaning",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text("₹$total"),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  child: Text(
                    "Service will be served soon !",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                // margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Price Details",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("Price for (1 item)"),
                          ),
                          Container(
                            child: Text("₹$price"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.white,
                // margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Text("Total Charges : ₹$total"),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          _launchURL();
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return PaymentUser();
                          //   },
                          // ));
                        },
                        child: Text(
                          "Pay & Place service",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to launch the URL
// void _launchURL() async {
//   const url = 'https://rzp.io/l/QI1sqUu';
// }

void _launchURL() async {
  const url = 'https://rzp.io/l/QI1sqUu';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
