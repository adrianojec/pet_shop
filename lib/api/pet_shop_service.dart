import 'package:pet_shop_with_navigation/models/models.dart';
import 'package:pet_shop_with_navigation/api/popular_pets_service.dart';
import 'package:pet_shop_with_navigation/api/best_seller_service.dart';

class PetShopService {
  Future<ExploreData> getExploreData() async {
    final petsOfTheDay = await getPetsOfTheDay();
    final bestSeller = await getBestSeller();

    return ExploreData(petsOfTheDay, bestSeller);
  }
}
