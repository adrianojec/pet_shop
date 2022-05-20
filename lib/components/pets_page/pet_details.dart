import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/components/pets_page/pet_details_body.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/models/models.dart';
import 'package:flutter/cupertino.dart';

class PetDetails extends StatelessWidget {
  final PetCategory petCategory;
  final Function(CartItem) addToCart;

  const PetDetails({
    Key? key,
    required this.petCategory,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.peachColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: Stack(
              children: [
                Hero(
                  tag: petCategory.petName,
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(petCategory.petImage),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Positioned(
                  top: 35,
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Palette.darkViolet.withOpacity(0.7),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                        color: Palette.peachColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: PetDetailsBody(
                    petCategory: petCategory,
                    addToCart: addToCart,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
