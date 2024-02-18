import 'package:coffee_shop/Screens/Home/HomePage.dart';
import 'package:coffee_shop/Screens/Order/grid_item_placeholder.dart';
import 'package:coffee_shop/Screens/Order/order_home.dart';
import 'package:coffee_shop/Screens/Splash_screen.dart';
import 'package:flutter/material.dart';

import 'Screens/Order/testing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Coffee Shop',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
