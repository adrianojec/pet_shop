import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/components/home_page/home_page.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/models/models.dart';
import 'package:pet_shop_with_navigation/widgets/text/bebas_neue_text.dart';

class PopularPetListView extends StatelessWidget {
  final List<PopularPets> pets;

  const PopularPetListView({
    Key? key,
    required this.pets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BebasNeueText(
                text: 'Popular Pets',
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
                color: Palette.darkViolet,
              ),
              const SizedBox(width: 10),
              const Icon(Icons.pets),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 400,
            color: Colors.transparent,
            //listview
            child: ListView.separated(
              padding: const EdgeInsets.only(
                bottom: 16,
                right: 16,
              ),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Palette.darkViolet.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(9, 12),
                      ),
                    ],
                  ),
                  child: buildCard(pet),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 16);
              },
              itemCount: pets.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(PopularPets pet) {
    switch (pet.cardType) {
      case PetsCardType.card1:
        return CardOne(pet: pet, color: Palette.peachColor);
      case PetsCardType.card2:
        return CardOne(pet: pet, color: Palette.darkViolet);
      default:
        throw Exception('This card doesn\'t exist!');
    }
  }
}
