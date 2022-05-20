import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/models/models.dart';
import 'package:pet_shop_with_navigation/widgets/text/roboto_text.dart';

class BestSellerTile extends StatelessWidget {
  final BestSeller bestSeller;

  const BestSellerTile({
    Key? key,
    required this.bestSeller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.darkViolet,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(bestSeller.itemImage),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RobotoText(
                  text: bestSeller.itemName,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Palette.peachColor,
                ),
                RobotoText(
                  text: bestSeller.description,
                  fontSize: 14,
                  color: Palette.peachColor,
                  softWrap: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RobotoText(
              text: '\$${bestSeller.itemPrice}',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Palette.peachColor,
            ),
          ),
        ],
      ),
    );
  }
}
