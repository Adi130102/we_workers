// import 'package:capestone_project/Category.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:we_workers/GlobalClass.dart';
import 'Category.dart';
import 'locationFetch.dart';

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
        title: Text(''),
        actions: [
          Icon(Icons.menu),
          SizedBox(
            width: 350,
          ),
          // Icon(Icons.notification_important),
          // SizedBox(
          //   width: 10,
          // ),
          Icon(Icons.share),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.search),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Where do you want your service?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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

            Navigator.push(context, MaterialPageRoute(builder: (context) {

              return Category();
            },));
          }, child: Text('Get Location'))
        ],
                //ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: (_) => LocationFetch()
                  //         ),
                  //       );
                  //     },
                  //     child: Text(
                  //       'I will enter my location manually',
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold, color: Colors.black),
                  //     ))

              ),
            )
          ],
        ),
      ),
    );
  }
}
