import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pet_shop_with_navigation/components/cart_page/cart_page.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/models/cart_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartManager>(
      builder: (context, cartManager, child) {
        return Scaffold(
          backgroundColor: Palette.peachColor,
          body: cartManager.cartItems.isEmpty
              ? const EmptyCartScreen()
              : const CartWithItems(),
        );
      },
    );
  }
}
