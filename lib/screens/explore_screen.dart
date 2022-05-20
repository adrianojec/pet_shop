import 'package:flutter/cupertino.dart';
import 'package:pet_shop_with_navigation/api/pet_shop_service.dart';
import 'package:pet_shop_with_navigation/components/home_page/home_page.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/models/models.dart';

class ExploreScreen extends StatelessWidget {
  final shopService = PetShopService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: shopService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: [
              PopularPetListView(pets: snapshot.data?.popularPets ?? []),
              const SizedBox(height: 16),
              BestSellerListView(bestSeller: snapshot.data?.bestSeller ?? []),
            ],
          );
        } else {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 20,
              color: Palette.darkViolet,
            ),
          );
        }
      },
    );
  }
}
