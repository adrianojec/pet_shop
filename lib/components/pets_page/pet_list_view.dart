import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/components/components.dart';
import 'package:pet_shop_with_navigation/models/models.dart';

class PetListView extends StatelessWidget {
  final Map<String, List<PetCategory>> petCategory;
  final String pet;

  const PetListView({
    Key? key,
    required this.petCategory,
    required this.pet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 135,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final dogCategory = petCategory[pet]![index];
              return PetCategoryTile(petCategory: dogCategory);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemCount: petCategory[pet]!.length,
          ),
        ),
      ],
    );
  }
}
