import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/widgets/text/roboto_text.dart';
import 'package:provider/provider.dart';
import 'package:pet_shop_with_navigation/components/pets_page/pet_details.dart';
import 'package:pet_shop_with_navigation/models/models.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';

class PetCategoryTile extends StatelessWidget {
  final PetCategory petCategory;

  const PetCategoryTile({
    Key? key,
    required this.petCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              final manager = Provider.of<CartManager>(context, listen: false);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PetDetails(
                      petCategory: petCategory,
                      addToCart: (item) {
                        manager.addItem(item);
                      },
                    );
                  },
                ),
              );
            },
            child: Hero(
              tag: petCategory.petName,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(petCategory.petImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Palette.darkViolet.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: RobotoText(
                text: petCategory.petName,
                fontSize: 18,
                color: Palette.peachColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
