import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: CategoriesAll(),
    debugShowCheckedModeBanner: false,
  ));
}

class CategoriesAll extends StatefulWidget {
  const CategoriesAll({Key? key}) : super(key: key);

  @override
  State<CategoriesAll> createState() => _CategoriesAllState();
}

class _CategoriesAllState extends State<CategoriesAll> {
  List<dynamic> listResponse = [];

  Future<void> categoriesAllCall() async {
    try {
      http.Response response;
      response = await http.get(Uri.parse(
          'https://awesomeworld1301.pythonanywhere.com/Service_CategoryApiGet/'));

      if (response.statusCode == 200) {
        setState(() {
          listResponse = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load categoriesAll');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    categoriesAllCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Categories',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: listResponse.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    height: 200, // Set the height of the container
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("object");
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.network(
                                  listResponse[index]['ServiceCategory_icon'],
                                  width: 100.0,
                                  height: 100.0,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  listResponse[index]['ServiceCategory_name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(height: 5),
                        // Text(
                        //   'ID: ${listResponse[index]['ServiceCategory_ID']}',
                        //   style: TextStyle(
                        //     color: Colors.grey[600],
                        //     fontSize: 12,
                        //   ),
                        // ),
                        // SizedBox(height: 5),
                        // Text(
                        //   'Active: ${listResponse[index]['ServiceCategory_isActive']}',
                        //   style: TextStyle(
                        //     color: Colors.grey[600],
                        //     fontSize: 12,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
