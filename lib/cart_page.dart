import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<String> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cartItems[index]),
            );
          },
        ),
      ),
    );
  }
}
