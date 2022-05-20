import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/models/cart_item.dart';

class CartManager extends ChangeNotifier {
  final _cartItems = <CartItem>[];

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);

  void deleteItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void addItem(CartItem item) {
    int itemIndex = -1;
    if (_cartItems.isNotEmpty) {
      List.generate(_cartItems.length, (index) {
        if (_cartItems[index].id == item.id) itemIndex = index;
      });
      itemIndex != -1 ? updateItem(item, itemIndex) : _cartItems.add(item);
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void updateItem(CartItem item, int index) {
    _cartItems[index] = item;
    notifyListeners();
  }

  double getTotal() {
    double total = 0.0;
    if (_cartItems.isNotEmpty) {
      List.generate(
          _cartItems.length, (index) => total += _cartItems[index].subTotal);
    }
    return total;
  }
}
