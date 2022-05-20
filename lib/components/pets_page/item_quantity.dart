import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/widgets/text/roboto_text.dart';

class ItemQuantity extends StatefulWidget {
  static int quantity = 1;

  const ItemQuantity({Key? key}) : super(key: key);

  @override
  State<ItemQuantity> createState() => _ItemQuantityState();
}

class _ItemQuantityState extends State<ItemQuantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:
                ItemQuantity.quantity != 1 ? Palette.lightViolet : Colors.grey,
          ),
          child: IconButton(
            iconSize: 20,
            icon: const Icon(
              CupertinoIcons.minus,
              color: Palette.peachColor,
            ),
            onPressed: () => setState(() =>
                ItemQuantity.quantity != 1 ? ItemQuantity.quantity -= 1 : null),
          ),
        ),
        const SizedBox(width: 10),
        RobotoText(
          text: ItemQuantity.quantity.toString(),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:
                ItemQuantity.quantity != 5 ? Palette.lightViolet : Colors.grey,
          ),
          child: IconButton(
            iconSize: 20,
            icon: const Icon(
              CupertinoIcons.add,
              color: Palette.peachColor,
            ),
            onPressed: () => setState(() =>
                ItemQuantity.quantity != 5 ? ItemQuantity.quantity += 1 : null),
          ),
        ),
      ],
    );
  }
}
