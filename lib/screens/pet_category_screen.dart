import 'package:flutter/cupertino.dart';
import 'package:pet_shop_with_navigation/components/pets_page/pets_page.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/models/models.dart';
import 'package:pet_shop_with_navigation/api/pet_category_service.dart';

class PetCategoryScreen extends StatelessWidget {
  const PetCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPetCategory(),
      builder: (BuildContext context,
          AsyncSnapshot<Map<String, List<PetCategory>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return PetCategoryListView(petCategory: snapshot.data ?? {});
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
