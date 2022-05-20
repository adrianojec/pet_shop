import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/models/explore_pets.dart';
import 'package:pet_shop_with_navigation/widgets/text/bebas_neue_text.dart';
import 'package:pet_shop_with_navigation/widgets/text/roboto_text.dart';

class CardOne extends StatelessWidget {
  final PopularPets pet;
  final Color color;

  const CardOne({
    Key? key,
    required this.pet,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BebasNeueText(
                  text: pet.title,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                Divider(
                  thickness: 2,
                  endIndent: 220,
                  color: color,
                ),
                RobotoText(
                  text: pet.subtitle,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 100,
                  child: RobotoText(
                    text: '"${pet.review}"',
                    softWrap: true,
                    fontSize: 15.0,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pet.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
