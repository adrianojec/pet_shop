import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/models/models.dart';
import 'package:pet_shop_with_navigation/components/pets_page/item_quantity.dart';
import 'package:pet_shop_with_navigation/widgets/text/bebas_neue_text.dart';
import 'package:pet_shop_with_navigation/widgets/text/roboto_text.dart';

class PetDetailsBody extends StatelessWidget {
  final PetCategory petCategory;
  final Function(CartItem) addToCart;

  const PetDetailsBody({
    Key? key,
    required this.petCategory,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 300,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Palette.peachColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          BebasNeueText(
            text: petCategory.petName,
            fontSize: 40,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: Text(
                petCategory.temperament,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Row(
            children: [
              const Icon(
                CupertinoIcons.time,
                size: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: RobotoText(
                  text: petCategory.lifeSpan,
                  fontSize: 18,
                ),
              ),
              const Icon(
                CupertinoIcons.money_dollar,
                size: 40,
              ),
              RobotoText(
                text: petCategory.petPrice.toStringAsFixed(0),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 20),
          const ItemQuantity(),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: () {
                final cartItem = CartItem(
                  id: petCategory.id,
                  petImage: petCategory.petImage,
                  petName: petCategory.petName,
                  petPrice: petCategory.petPrice,
                  quantity: ItemQuantity.quantity,
                );
                addToCart(cartItem);
                Fluttertoast.showToast(
                  msg: '${petCategory.petName} has been added to cart',
                  fontSize: 16,
                  backgroundColor: Palette.darkViolet,
                  textColor: Palette.peachColor,
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_LONG,
                );
                ItemQuantity.quantity = 1;
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(
                    Palette.darkViolet.withOpacity(0.2)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Palette.peachColor),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Palette.lightViolet),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RobotoText(
                  text: 'Add to Cart',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Palette.peachColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
