import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop_with_navigation/models/models.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/widgets/text/roboto_text.dart';

class CartItemTile extends StatefulWidget {
  final CartItem item;
  final int index;
  final CartManager manager;

  const CartItemTile({
    Key? key,
    required this.item,
    required this.index,
    required this.manager,
  }) : super(key: key);

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  @override
  Widget build(BuildContext context) {
    int quantity = widget.item.quantity;
    return Card(
      margin: EdgeInsets.zero,
      elevation: 5.0,
      shadowColor: Palette.darkViolet,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 115,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              image: DecorationImage(
                image: AssetImage(widget.item.petImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RobotoText(
                  text: widget.item.petName,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Palette.darkViolet,
                  softWrap: true,
                  maxLines: 2,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  height: 2.0,
                  width: 30,
                  color: Palette.darkViolet,
                ),
                RobotoText(
                  text: '\$${widget.item.petPrice.toStringAsFixed(0)}',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Palette.darkViolet,
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Subtotal: '),
                      RobotoText(
                        text: '\$${(widget.item.subTotal).toStringAsFixed(0)}',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Palette.darkViolet,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Palette.lightViolet,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (quantity != 5) {
                        quantity += 1;
                        final cartItem = CartItem(
                          id: widget.item.id,
                          petImage: widget.item.petImage,
                          petName: widget.item.petName,
                          petPrice: widget.item.petPrice,
                          quantity: quantity,
                        );
                        widget.manager.updateItem(
                          cartItem,
                          widget.index,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Sorry! You\'ve reached the maximum quantity'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    });
                  },
                ),
                RobotoText(
                  text: quantity.toString(),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.minus,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (quantity != 1) {
                        quantity -= 1;
                        final cartItem = CartItem(
                          id: widget.item.id,
                          petImage: widget.item.petImage,
                          petName: widget.item.petName,
                          petPrice: widget.item.petPrice,
                          quantity: quantity,
                        );
                        widget.manager.updateItem(
                          cartItem,
                          widget.index,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please swipe to the left to remove.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
