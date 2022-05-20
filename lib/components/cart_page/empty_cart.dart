import 'package:flutter/material.dart';
import 'package:pet_shop_with_navigation/widgets/text/bebas_neue_text.dart';
import 'package:pet_shop_with_navigation/widgets/text/roboto_text.dart';
import 'package:provider/provider.dart';
import 'package:pet_shop_with_navigation/constants/constants.dart';
import 'package:pet_shop_with_navigation/models/models.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/empty_cart/empty_cart.png'),
              ),
            ),
            BebasNeueText(
              text: 'Oops! Your Cart is empty!',
              fontSize: 30.0,
            ),
            RobotoText(
              text: 'But it doesn\'t have to be.',
              fontSize: 18,
            ),
            const SizedBox(height: 15),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Palette.lightViolet),
                overlayColor: MaterialStateProperty.all<Color>(
                    Palette.peachColor.withOpacity(0.2)),
              ),
              onPressed: () =>
                  Provider.of<TabManager>(context, listen: false).goToPets(),
              child: RobotoText(
                text: 'CHOOSE YOUR PET NOW!',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Palette.peachColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
