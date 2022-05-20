import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/routes/route_manager.dart';
import 'package:pet_shop_with_navigation/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:pet_shop_with_navigation/models/models.dart';

void main() {
  runApp(const PetShopApp());
}

class PetShopApp extends StatelessWidget {
  const PetShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabManager()),
        ChangeNotifierProvider(create: (context) => CartManager()),
      ],
      child: const MaterialApp(
        initialRoute: WelcomeScreen.routeName,
        onGenerateRoute: RouteManager.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
