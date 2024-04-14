import 'package:flutter/material.dart';
import 'Payment.dart';

void main() {
  const MaterialApp(
    home: AcceptedService(),
    debugShowCheckedModeBanner: false,
  );
}

class AcceptedService extends StatefulWidget {
  const AcceptedService({super.key});

  @override
  State<AcceptedService> createState() => _AcceptedServiceState();
}

class _AcceptedServiceState extends State<AcceptedService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accepted Service'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, size: 50.0),
                  Text(
                    'Location',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
                  )
                ],
              ),
            ),
            Image(width: 450, image: AssetImage('assets/images/Location.jpg')),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.location_on,
              size: 70.0,
            ),
            Text(
              '12.5 Km Away',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            Text(
              'Swastick Society, Navrangpura',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => Payment(),
                    ),
                  );
                },
                child: Text('Payment Page'))
          ],
        ),
      ),
    );
  }
}
