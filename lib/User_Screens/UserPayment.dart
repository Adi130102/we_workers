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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                  color: Colors.blueGrey.shade50,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Options:',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 15),
                      CheckboxListTile(
                        value: pay,
                        onChanged: (value) {
                          setState(() {
                            pay = value!;
                          });
                        },
                        activeColor: Colors.blueGrey,
                        title: Text("Paytm"),
                      ),
                      CheckboxListTile(
                        value: Gpa,
                        onChanged: (value) {
                          setState(() {
                            Gpa = value!;
                          });
                        },
                        activeColor: Colors.blueGrey,
                        title: Text("Gpay"),
                      ),
                      CheckboxListTile(
                        value: Wal,
                        onChanged: (value) {
                          setState(() {
                            Wal = value!;
                          });
                        },
                        activeColor: Colors.blueGrey,
                        title: Text("Wallet"),
                      ),
                      CheckboxListTile(
                        value: cre,
                        onChanged: (value) {
                          setState(() {
                            cre = value!;
                          });
                        },
                        activeColor: Colors.blueGrey,
                        title: Text("Credit/Debit Card"),
                      ),
                      CheckboxListTile(
                        value: Net,
                        onChanged: (value) {
                          setState(() {
                            Net = value!;
                          });
                        },
                        activeColor: Colors.blueGrey,
                        title: Text("Net Banking"),
                      ),
                      CheckboxListTile(
                        value: cash,
                        onChanged: (value) {
                          setState(() {
                            cash = value!;
                          });
                        },
                        activeColor: Colors.blueGrey,
                        title: Text("Cash"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 1450,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blueGrey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
