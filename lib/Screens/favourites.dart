import 'package:coffee_shop/Components/order_components.dart';
import 'package:coffee_shop/coffee_theme.dart';
import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.05,
          ),
          const SizedBox(
            width: double.infinity,
          ),
          Container(
            width: screenWidth * 0.85,
            height: screenHeight * 0.2,
            decoration: BoxDecoration(
              color: Colors.redAccent.shade100,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: CoffeeColors().myBrown,
                width: 3,
              ),
              image: const DecorationImage(
                image: AssetImage('assets/pictures/FavouriteImage.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CoffeeText(
            text: 'Coffee Picks',
            size: 36,
            isBold: true,
            color: CoffeeColors().textBlack,
          )
        ],
      ),
    );
  }
}
