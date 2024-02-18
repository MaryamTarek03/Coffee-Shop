import 'package:flutter/material.dart';

class MyColors {
  Color myBrown = const Color.fromRGBO(198, 124, 78, 1);
  Color myGrey = const Color.fromRGBO(242, 242, 242, 1);
  Color textBlack = const Color.fromRGBO(50, 50, 50, 1);
  Color textGrey = const Color.fromRGBO(128, 128, 128, 1);
  Color buttonGreyBorder = const Color.fromRGBO(215, 215, 215, 1);
}

class Constants extends StatelessWidget {
  const Constants({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return const Placeholder();
  }
}
