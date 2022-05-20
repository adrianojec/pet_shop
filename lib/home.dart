import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/screens/screens.dart';
import 'package:pet_shop_with_navigation/models/models.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List pages = [
    ExploreScreen(),
    const PetCategoryScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final tabManager = Provider.of<TabManager>(context);
    return Scaffold(
      backgroundColor: Palette.peachColor,
      body: pages[tabManager.selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        backgroundColor: Palette.peachColor,
        selectedItemColor: Palette.darkViolet,
        currentIndex: tabManager.selectedTab,
        onTap: (index) => setState(() => tabManager.goToTab(index)),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_alt),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.paw),
            label: 'Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
