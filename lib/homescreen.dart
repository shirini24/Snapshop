// lib/homescreen.dart
import 'package:flutter/material.dart';
import 'cartscreen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Watch',
      'description': 'Description of Product 1',
      'price': 29.99,
      'image': 'images/watch.png', // Add the image path here
    },
    {
      'name': 'Product 2',
      'description': 'Description of Product 2',
      'price': 19.99,
      'image': 'assets/images/product2.jpg', // Add the image path here
    },
    {
      'name': 'Product 3',
      'description': 'Description of Product 3',
      'price': 39.99,
      'image': 'assets/images/product3.jpg', // Add the image path here
    },
    {
      'name': 'Product 4',
      'description': 'Description of Product 4',
      'price': 49.99,
      'image': 'assets/images/product4.jpg', // Add the image path here
    },
  ];

  void _addToCart(BuildContext context, Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(product: product), // Passing product to CartScreen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Products',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Image.asset(
                      product['image'], // Use Image.asset to load the product image
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover, // Adjust image size and fit
                    ),
                    title: Text(product['name']),
                    subtitle: Text(product['description'] + "\nPrice: \$${product['price']}"),
                    trailing: ElevatedButton(
                      onPressed: () => _addToCart(context, product), // Call the method to add to cart
                      child: Text('Add to Cart'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
