import 'package:coffee_shop/Screens/Home/HomePage.dart';
import 'package:coffee_shop/Screens/SignIn/login_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Order/order_components.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: screenWidth * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Image(
                  image: AssetImage(
                    "assets/pictures/OnboardingCoffee.png",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const MyText(
                      text: 'Coffee so good, your taste buds will love it ..',
                      size: 34,
                      isBold: true,
                      color: Colors.white,
                    ),
                    const MyText(
                      text:
                          'The best grain, the finest roast, the powerful flavor.',
                      size: 18,
                      isBold: false,
                      color: Colors.white70,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return LoginPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(198, 124, 78, 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
