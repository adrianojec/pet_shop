import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pet_shop_with_navigation/models/explore_pets.dart';

Future<List<PopularPets>> getPetsOfTheDay() async {
  await Future.delayed(const Duration(milliseconds: 1000));
  final dataString =
      await rootBundle.loadString('assets/sample_data/explore_pets.json');
  final Map<String, dynamic> json = jsonDecode(dataString);

  if (json['pets'] != null) {
    final pets = <PopularPets>[];
    json['pets'].forEach((v) {
      pets.add(PopularPets.fromJson(v));
    });
    return pets;
  } else {
    return List.empty(growable: true);
  }
}
