import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pet_shop_with_navigation/models/explore_pet_category.dart';

Future<Map<String, List<PetCategory>>> getPetCategory() async {
  await Future.delayed(const Duration(seconds: 1));
  final petCategoryJson =
      await rootBundle.loadString('assets/sample_data/pet_category.json');
  final Map<String, dynamic> json = jsonDecode(petCategoryJson);

  if (json.isNotEmpty) {
    final petCategories = <String, List<PetCategory>>{};
    json.forEach((key, value) {
      final List<PetCategory> petCategory = List.empty(growable: true);
      json[key]
          .map((pet) => petCategory.add(PetCategory.fromJson(pet)))
          .toList();
      petCategories.addAll({key: petCategory});
    });
    return petCategories;
  }
  return <String, List<PetCategory>>{};
}
