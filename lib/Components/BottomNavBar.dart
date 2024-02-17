import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIconBar = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 34,
      currentIndex: selectedIconBar,
      backgroundColor: const Color(0xffF9F9F9),
      selectedItemColor: const Color(0xffC77B51),
      unselectedItemColor: Colors.grey,
      selectedFontSize: 14.0,
      unselectedFontSize: 12.0,
      showSelectedLabels: true,
      //type: BottomNavigationBarType.shifting,
      onTap: (val) {
        setState(() {
          selectedIconBar = val;
          //print(selectedIconBar);
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/Home.png'),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/Heart.png'),
          ),
          label: 'Fav',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/ShoppingBag.png'),
          ),
          label: 'Shopping',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/Notification.png'),
          ),
          label: 'Notification',
        ),
      ],
    );
  }
}
