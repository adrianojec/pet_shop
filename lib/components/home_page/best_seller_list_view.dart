import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/models/models.dart';
import 'package:pet_shop_with_navigation/components/home_page/home_page.dart';
import 'package:pet_shop_with_navigation/widgets/text/bebas_neue_text.dart';

class BestSellerListView extends StatelessWidget {
  final List<BestSeller> bestSeller;

  const BestSellerListView({
    Key? key,
    required this.bestSeller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BebasNeueText(
            text: 'Best Sellers!',
            fontSize: 25,
            fontWeight: FontWeight.w200,
            color: Palette.darkViolet,
          ),
          const SizedBox(height: 16),
          //Post listview
          ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) =>
                BestSellerTile(bestSeller: bestSeller[index]),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemCount: bestSeller.length,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
