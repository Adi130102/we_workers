import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: PaymentUser(),
    debugShowCheckedModeBanner: false,
  ));
}

class PaymentUser extends StatefulWidget {
  @override
  State<PaymentUser> createState() => _PaymentUserState();
}

class _PaymentUserState extends State<PaymentUser> {
  bool pay = false;
  bool Gpa = false;
  bool Wal = false;
  bool cre = false;
  bool Net = false;
  bool cash = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 1450,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
                color: Colors.grey.shade50,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Text(
                  'Payment',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        color: Colors.blueGrey.shade50),
                    child: Column(children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                            child: Text(
                              'Payment Options:',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                        child: Column(
                          children: [
                            Container(
                              child: CheckboxListTile(
                                value: pay,
                                onChanged: (value) {
                                  print(value);
                                  pay = value!;
                                  setState(() {});
                                },
                                activeColor: Colors.blueGrey,
                                title: Text("Paytm"),
                              ),
                            ),
                            Container(
                              child: CheckboxListTile(
                                value: Gpa,
                                onChanged: (value) {
                                  print(value);
                                  Gpa = value!;
                                  setState(() {});
                                },
                                activeColor: Colors.blueGrey,
                                title: Text("Gpay"),
                              ),
                            ),
                            Container(
                              child: CheckboxListTile(
                                value: Wal,
                                onChanged: (value) {
                                  print(value);
                                  Wal = value!;
                                  setState(() {});
                                },
                                activeColor: Colors.blueGrey,
                                title: Text("Wallet"),
                              ),
                            ),
                            Container(
                              child: CheckboxListTile(
                                value: cre,
                                onChanged: (value) {
                                  print(value);
                                  cre = value!;
                                  setState(() {});
                                },
                                activeColor: Colors.blueGrey,
                                title: Text("Credit/Debit Card"),
                              ),
                            ),
                            Container(
                              child: CheckboxListTile(
                                value: Net,
                                onChanged: (value) {
                                  print(value);
                                  Net = value!;
                                  setState(() {});
                                },
                                activeColor: Colors.blueGrey,
                                title: Text("Net Baking"),
                              ),
                            ),
                            Container(
                              child: CheckboxListTile(
                                value: cash,
                                onChanged: (value) {
                                  print(value);
                                  cash = value!;
                                  setState(() {});
                                },
                                activeColor: Colors.blueGrey,
                                title: Text("Cash"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 264, 0, 0),
                  child: SizedBox(
                    width: 1450,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.blueGrey),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
