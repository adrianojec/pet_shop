import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/home.dart';
import 'package:pet_shop_with_navigation/widgets/text/bebas_neue_text.dart';
import 'package:pet_shop_with_navigation/widgets/text/roboto_text.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.peachColor,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset('assets/welcome/dogGif.gif'),
            ),
          ),
          Container(
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60.0,
                  vertical: 30.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BebasNeueText(
                      text: 'Find your Best Friend with us',
                      fontSize: 50.0,
                    ),
                    const SizedBox(height: 10),
                    RobotoText(
                      text:
                          'Let\'s start your journey with your beloved pets and enjoy life better!',
                      fontSize: 20,
                      color: Colors.grey,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                    const SizedBox(height: 40),
                    MaterialButton(
                      minWidth: size.width,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      color: Palette.lightViolet,
                      onPressed: () {
                        Navigator.of(context).pushNamed(Home.routeName);
                      },
                      child: RobotoText(
                        text: 'Get Started',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Palette.peachColor,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
