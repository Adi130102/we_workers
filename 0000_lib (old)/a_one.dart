
import 'package:flutter/material.dart';
// import 'package:we_workers/a_two.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: Trial(),
    debugShowCheckedModeBanner: false,
  ));
}

class Trial extends StatefulWidget {
  const Trial({Key? key}) : super(key: key);

  @override
  State<Trial> createState() => _TrialState();
}
class _TrialState extends State<Trial> {
  // User useAPI = User();
  List<dynamic> listResponse = [];

  Future<void> userCall() async {
    try {
      http.Response response;
      response = await http.get(Uri.parse(
          'https://awesomeworld1301.pythonanywhere.com/userApiGet'));

      if (response.statusCode == 200) {
        setState(() {
          listResponse = json.decode(response.body);
          // print(listResponse);
        });
      } else {
        throw Exception('Failed to load UserAll');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    userCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Profiles using API")
      ),
      body: Container(
        child: ListView.builder(
          // scrollDirection:
          // Axis.horizontal,
          itemCount: listResponse.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.all(
                          10.0),
                      // child: Text(listResponse[index]['first_name']),
                    ),
                    Text(listResponse[
                    index]['user_ID']
                        .toString()),
                    Text(listResponse[
                    index][
                    'email']),
                    // Image.network(
                    //   listResponse[index][
                    //   'ServiceCategory_icon'],
                    //   width: 100.0,
                    // ),
                    Text(listResponse[
                    index][
                    'phone']
                        .toString()),
                  ],
                ),
              ),
            );
          },
        ),
        // FutureBuilder<List<dynamic>>(
        //   future: useAPI.userALL(),
        //   builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //     // print(snapshot.data);
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasError) {
        //       // Handle error gracefully
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     }
        //     else if (snapshot.hasData) {
        //       List<dynamic> data = snapshot.data!;
        //       // Accessing the 'User List' from the first map in the list
        //       List<dynamic> userList = data[0]['User List'];
        //       return ListView.builder(
        //         itemCount: userList.length,
        //         itemBuilder: (context, index) {
        //           // Accessing properties of each user in the 'User List'
        //           // String firstName = userList[index]['first_name'] ?? 'Unknown';
        //           // String email = userList[index]['email'] ?? 'Unknown';
        //           return Card(
        //             child: ListTile(
        //               title: Text(userList[index]['first_name'].toString()),
        //               subtitle: Text(userList[index]['email'].toString()),
        //             ),
        //           );
        //         },
        //       );
        //     }
        //     else {
        //       return Center(child: Text('No Data Found'));
        //     }
        //   },
        // ),
      ),
    );
  }
}
