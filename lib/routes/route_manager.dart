import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/screens/screens.dart';
import 'package:pet_shop_with_navigation/home.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Home.routeName:
        return MaterialPageRoute(builder: (_) => const Home());
      default:
        return throw Exception('Error 404');
    }
  }
}
