import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/widgets/text/bebas_neue_text.dart';
import 'package:pet_shop_with_navigation/widgets/text/roboto_text.dart';
import 'package:provider/provider.dart';
import 'package:pet_shop_with_navigation/components/cart_page/cart_item_tile.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/models/cart_manager.dart';

class CartWithItems extends StatelessWidget {
  const CartWithItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartManager>(context).cartItems;
    final manager = Provider.of<CartManager>(context);
    double tax = manager.getTotal() * 0.03;
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        right: 16.0,
        left: 16.0,
      ),
      child: Column(
        children: [
          BebasNeueText(
            text: 'CART',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 280,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(cartItems[index].id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    manager.deleteItem(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            '${cartItems[index].petName} was removed from Cart.'),
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () => manager.addItem(cartItems[index]),
                        ),
                      ),
                    );
                  },
                  background: Container(
                    padding: const EdgeInsets.only(right: 10),
                    color: Palette.redWarning,
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      CupertinoIcons.delete_simple,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  child: CartItemTile(
                    item: cartItems[index],
                    index: index,
                    manager: manager,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 18.0),
              itemCount: cartItems.length,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RobotoText(
                text: 'Subtotal',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Palette.lightViolet,
              ),
              BebasNeueText(
                text: '\$${manager.getTotal()}',
                fontSize: 25,
                color: Palette.lightViolet,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RobotoText(
                text: 'Tax',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Palette.lightViolet,
              ),
              BebasNeueText(
                text: '\$${tax.toStringAsFixed(2)}',
                fontSize: 25,
                color: Palette.lightViolet,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BebasNeueText(
                text: 'Total',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Palette.darkViolet,
              ),
              BebasNeueText(
                text: '\$${manager.getTotal() + tax}',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Palette.darkViolet,
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: MaterialButton(
              color: Palette.lightViolet,
              onPressed: () {},
              child: RobotoText(
                text: 'Checkout',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Palette.peachColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
