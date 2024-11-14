// lib/models/cart.dart
import 'package:flutter/foundation.dart';
import 'product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (existing) => CartItem(
        product: existing.product,
        quantity: existing.quantity + 1,
      ));
    } else {
      _items.putIfAbsent(product.id, () => CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  double get totalAmount {
    return _items.values.fold(0.0, (sum, item) => sum + item.product.price * item.quantity);
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
