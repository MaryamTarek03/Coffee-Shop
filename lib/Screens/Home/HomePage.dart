import 'package:coffee_shop/Screens/Home/Pages/nav_home.dart';
import 'package:coffee_shop/Screens/Order/order_home.dart';
import 'package:flutter/material.dart';

import 'Components/BottomNavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: Stack(
        children: [
          Offstage(
            offstage: selectedIndex != 0,
            child: const NavHome(),
          ),
          Offstage(
            offstage: selectedIndex != 1,
            child: const NavHome(),
          ),
          Offstage(
            offstage: selectedIndex != 2,
            child: OrderHome(updateIndex: updateSelectedIndex),
          ),
          Offstage(
            offstage: selectedIndex != 3,
            child: const NavHome(),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 15,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: Container(
          height: screenSize.height * 0.122,
          width: screenSize.width * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: NavBar(
                updateParent: updateSelectedIndex,
                selectedIcon: selectedIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
