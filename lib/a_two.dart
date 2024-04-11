// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Demo {
//   // String baseURL = "http://10.0.2.2:8000/adiAPI/";
//   String baseURL = "http://127.0.0.1:8000/adiAPI/";
//
//   Future<List<dynamic>> userALL() async {
//     try {
//       var response = await http.get(Uri.parse(baseURL));
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         // print('Failed to fetch data: ${response.statusCode}');
//         return Future.error("Server Error");
//       }
//     } catch (e) {
//       return Future.error(e);
//       // print('Error: $e');
//     }
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  // String baseURL = "http://127.0.0.1:8000/adiAPI/";
  String baseURL = "https://awesomeworld1301.pythonanywhere.com/userAPI/";


  // String baseURL = "http://10.0.2.2:8000/adiAPI/";

  // String baseURL = "http://192.168.1.16:8000/adiAPI/";

  Future<List<dynamic>> userALL() async {
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        // Parse the JSON response
        dynamic jsonData = jsonDecode(response.body);

        // Check if the response is a list or a single object
        if (jsonData is List) {
          // If it's a list, return it directly
          return jsonData;
        } else if (jsonData is Map<String, dynamic>) {
          // If it's a single object, extract the data and return it as a list
          // Adjust this part based on the structure of your JSON response
          List<dynamic> dataList = [jsonData]; // Convert the single object into a list
          return dataList;
        } else {
          // Unexpected response format
          throw Exception('Unexpected response format');
        }
      } else {
        // Server returned an error status code
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Error occurred during HTTP request or JSON parsing
      throw Exception('Error: $e');
    }
  }
}
