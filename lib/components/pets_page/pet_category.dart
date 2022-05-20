import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/components/pets_page/pet_list_view.dart';
import 'package:pet_shop_with_navigation/models/models.dart';
import 'package:pet_shop_with_navigation/widgets/text/bebas_neue_text.dart';

class PetCategoryListView extends StatelessWidget {
  final Map<String, List<PetCategory>> petCategory;

  const PetCategoryListView({
    Key? key,
    required this.petCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Dogs
            const SizedBox(height: 20),
            BebasNeueText(
              text: 'Dogs',
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
            PetListView(
              petCategory: petCategory,
              pet: 'dogs',
            ),
            //Cats
            const SizedBox(height: 10),
            BebasNeueText(
              text: 'Cats',
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
            PetListView(
              petCategory: petCategory,
              pet: 'cats',
            ),
            //Birds
            const SizedBox(height: 10),
            BebasNeueText(
              text: 'Birds',
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
            PetListView(
              petCategory: petCategory,
              pet: 'birds',
            ),
            //Hamsters
            const SizedBox(height: 10),
            BebasNeueText(
              text: 'Hamsters',
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
            PetListView(
              petCategory: petCategory,
              pet: 'hamsters',
            ),
            //Rabbits
            const SizedBox(height: 10),
            BebasNeueText(
              text: 'Rabbits',
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
            PetListView(
              petCategory: petCategory,
              pet: 'rabbits',
            ),
          ],
        ),
      ),
    );
  }
}
