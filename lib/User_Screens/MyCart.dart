import 'package:flutter/material.dart';
import 'package:we_workers/User_Screens/AllServices.dart';
import 'Payment.dart';

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
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: widget.cartItems.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Cart.jpg",width: 200,),
            SizedBox(height: 20,),
            Text(
              'Your Cart is Empty',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AllServices();
              },)).then((value) => setState(() {}));
            }, child: Text("Add Item to Cart")),
          ],
        ),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                return _buildCartItem(widget.cartItems[index]);
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
          _buildPaymentButton(),
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
          icon: Icon(Icons.delete,color: Colors.deepPurple,),
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PaymentUser();
              },
            ),
          );
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
