// import 'package:capestone_project/Category.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:we_workers/UserNotifications.dart';
import 'package:we_workers/User_Screens/UserHome.dart';
import 'GlobalClass.dart';
import 'UserHome.dart';
import 'UserNotifications.dart';

void main() {
  const MaterialApp(
    home: Location(),
  );
}

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    GlobalLocation.Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFedbea4),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return notifications();
            },));
          }, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      // drawer: Drawer(
      //   child: SafeArea(
      //     child: Column(
      //       children: [
      //         Container(
      //           padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      //           decoration: BoxDecoration(color: Colors.grey[200]),
      //           width: double.maxFinite,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Container(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       "Aditya Patel",
      //                       style: TextStyle(
      //                         fontSize: 20,
      //                       ),
      //                     ),
      //                     Text("pateladitya130102@gmail.com"),
      //                     Text("9427178733")
      //                   ],
      //                 ),
      //               ),
      //               Container(
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.circular(100.0),
      //                   child: Image.asset(
      //                     "assets/Adi1.jpg",
      //                     height: 70,
      //                     width: 70,
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Image(
              width: 470,
              image: AssetImage("assets/images/Location.jpg"),
            ),
            SizedBox(
              height: 4,
            ),
            Icon(
              Icons.location_on,
              size: 50.0,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 500,
              height: 253,
              color: Colors.blue.shade200,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Where do you want your service?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    Text('Coordinates Points',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text(GlobalLocation.location,style: TextStyle(color: Colors.black,fontSize: 16),),
                    SizedBox(height: 10,),
                    Text('ADDRESS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text('${GlobalLocation.Address}'),
                    ElevatedButton(onPressed: () async{
                      Position position = await _getGeoLocationPosition();
                      GlobalLocation.location ='Lat: ${position.latitude} , Long: ${position.longitude}';
                      GetAddressFromLatLong(position);

                      Timer(Duration(milliseconds: 2500), () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) {

                          return Categories();
                        },));

                      });
                    }, child: Text('Get Location'),
                    ),


                    SizedBox(height: 20,),

                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //           builder: (_) => categories(),
                    //         ),
                    //       );
                    //     },
                    //     child: Text(
                    //       'I will enter my location manually',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, color: Colors.black),
                    //     ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}