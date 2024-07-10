import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Cash.dart';

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
  String? selectedPaymentOption;

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
                      RadioListTile(
                        title: Text("Paytm"),
                        value: "Paytm",
                        groupValue: selectedPaymentOption,
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentOption = value as String?;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Gpay"),
                        value: "Gpay",
                        groupValue: selectedPaymentOption,
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentOption = value as String?;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Wallet"),
                        value: "Wallet",
                        groupValue: selectedPaymentOption,
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentOption = value as String?;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Card"),
                        value: "Card",
                        groupValue: selectedPaymentOption,
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentOption = value as String?;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Net Banking"),
                        value: "Net Banking",
                        groupValue: selectedPaymentOption,
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentOption = value as String?;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Cash"),
                        value: "Cash",
                        groupValue: selectedPaymentOption,
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentOption = value as String?;
                          });
                        },
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 1450,
                child: ElevatedButton(
                  onPressed: () {
                    // Redirect based on the selected payment option
                    if (selectedPaymentOption == "Paytm") {
                      launch('https://rzp.io/l/QI1sqUu');
                    } else if (selectedPaymentOption == "Gpay") {
                      launch('https://rzp.io/l/QI1sqUu');
                    } else if (selectedPaymentOption == "Wallet"){
                      launch('https://rzp.io/l/QI1sqUu');
                    }else if (selectedPaymentOption == "Card"){
                      launch('https://rzp.io/l/QI1sqUu');
                    }else if (selectedPaymentOption == "Net Banking"){
                      launch('https://rzp.io/l/QI1sqUu');
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CashPaymentConfirmation();
                      },));
                    }

                    // Add more conditions for other payment options if needed
                  },
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
