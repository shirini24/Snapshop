// lib/cartscreen.dart
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final Map<String, dynamic> product; // Receives product from HomeScreen

  const CartScreen({Key? key, required this.product}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    addProductToCart(widget.product); // Add the passed product when CartScreen is initialized
  }

  void addProductToCart(Map<String, dynamic> product) {
    setState(() {
      cartItems.add(product);
    });
  }

  double get totalPrice {
    return cartItems.fold(0.0, (sum, item) => sum + ((item['price'] ?? 0.0) as double));
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Cart',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(item['name'] ?? 'Unnamed Product'),
                    subtitle: Text('Price: \$${item['price'] ?? 0.0}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add checkout functionality here
              },
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
