
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
  String price = 'Price : ';

  Future<void> categoriesAllCall() async {
    try {
      http.Response response;
      response = await http.get(Uri.parse(
          'https://awesomeworld1301.pythonanywhere.com/ServiceApiGet/'));

      if (response.statusCode == 200) {
        listResponse = json.decode(response.body);
        setState(() {});
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
          'All Services',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
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
                  // height: 200, // Set the height of the container
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        child: Column(
                          children: [
                            Image.network(
                              listResponse[index]['Service_icon'],
                              width: 100.0,
                              height: 100.0,
                            ),
                            Container(
                              // width: 100,
                              child: Text(
                                listResponse[index]['Service_type'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              // width: 50,
                              child: Text("Price : "+listResponse[index]['Service_price'.toString()],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10,),
                            ElevatedButton(
                              onPressed: () {},
                              child:
                                Text("Add to cart")
                            )
                            // ContainerLayer(
                            //   child:
                            // ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                          child: Text(
                            listResponse[index]['Service_description'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
