import 'package:flutter/material.dart';

import 'UserPayment.dart';

class MyCart extends StatefulWidget {
  final List<dynamic> cartItems;

  MyCart({required this.cartItems});

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    int totalPrice = _calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length + 1,
              itemBuilder: (context, index) {
                if (index < widget.cartItems.length) {
                  return _buildCartItem(widget.cartItems[index]);
                } else {
                  return _buildPaymentButton();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '₹$totalPrice',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(
          item['Service_icon'],
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(item['Service_type']),
        subtitle: Text('Price: ${item['Service_price']}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _removeItem(item);
          },
        ),
      ),
    );
  }

  Widget _buildPaymentButton() {
    return ListTile(
      title: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
             return PaymentUser();
          },));
        },
        child: Text('Proceed to Payment'),
      ),
    );
  }

  void _removeItem(Map<String, dynamic> item) {
    setState(() {
      widget.cartItems.remove(item);
    });
  }

  int _calculateTotalPrice() {
    int totalPrice = 0;
    for (Map<String, dynamic> item in widget.cartItems) {
      try {
        double priceDouble = double.parse(item['Service_price'].toString());
        int price = priceDouble.round();
        totalPrice += price;
      } catch (e) {
        print('Error parsing Service_price: $e');
      }
    }
    return totalPrice;
  }
}
