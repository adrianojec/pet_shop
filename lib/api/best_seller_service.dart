import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pet_shop_with_navigation/models/best_seller.dart';

Future<List<BestSeller>> getBestSeller() async {
  await Future.delayed(const Duration(seconds: 1));
  final dataString =
      await rootBundle.loadString('assets/sample_data/best_sellers.json');
  final Map<String, dynamic> json = jsonDecode(dataString);

  if (json['best sellers'] != null) {
    final List<BestSeller> bestSellers = List.empty(growable: true);
    json['best sellers']
        .map((data) => bestSellers.add(BestSeller.fromJson(data)))
        .toList();
    return bestSellers;
  } else {
    return List.empty(growable: true);
  }
}
