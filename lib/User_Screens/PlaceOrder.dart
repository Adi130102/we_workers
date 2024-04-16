import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController serviceIdController = TextEditingController();
  TextEditingController technicianIdController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController reviewRatingController = TextEditingController();

  Future<void> _sendDataToApi() async {
    String apiUrl = 'your_api_endpoint_here';
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Service_ID': serviceIdController.text,
        'Technician_Id': technicianIdController.text,
        'Status': statusController.text,
        'Review_Rating': reviewRatingController.text,
      }),
    );

    if (response.statusCode == 201) {
      // Data inserted successfully
      print('Data inserted successfully');
    } else {
      // Error occurred while inserting data
      print('Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: serviceIdController,
              decoration: InputDecoration(labelText: 'Service ID'),
            ),
            TextField(
              controller: technicianIdController,
              decoration: InputDecoration(labelText: 'Technician ID'),
            ),
            TextField(
              controller: statusController,
              decoration: InputDecoration(labelText: 'Status'),
            ),
            TextField(
              controller: reviewRatingController,
              decoration: InputDecoration(labelText: 'Review Rating'),
            ),
            ElevatedButton(
              onPressed: _sendDataToApi,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BookingPage(),
  ));
}
