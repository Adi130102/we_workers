
import 'package:flutter/material.dart';
import 'package:we_workers/a_two.dart';

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
  User useAPI = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Profiles using API")
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: useAPI.userALL(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Handle error gracefully
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            else if (snapshot.hasData) {
              List<dynamic> data = snapshot.data!;
              // Accessing the 'User List' from the first map in the list
              List<dynamic> userList = data[0]['User List'];
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  // Accessing properties of each user in the 'User List'
                  String firstName = userList[index]['first_name'] ?? 'Unknown';
                  String email = userList[index]['email'] ?? 'Unknown';
                  return Card(
                    child: ListTile(
                      title: Text(firstName),
                      subtitle: Text(email),
                    ),
                  );
                },
              );
            }
            else {
              return Center(child: Text('No Data Found'));
            }
          },
        ),
      ),
    );
  }
}
