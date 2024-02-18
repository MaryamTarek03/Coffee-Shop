import 'package:coffee_shop/Screens/Order/Components/list_of_orders.dart';
import 'package:coffee_shop/Screens/Order/Components/order_item.dart';
import 'package:flutter/material.dart';

class GridPlaceholder extends StatefulWidget {
  GridPlaceholder({super.key, required this.onPressed});

  final String name = 'Cup';
  final String subName = 'with LOVE';
  final String imagePicture = 'assets/pictures/OnboardingCoffee.png';
  final double price = 5.5;

  final void Function(List<Widget>) onPressed;

  @override
  State<GridPlaceholder> createState() => _GridPlaceholderState();
}

class _GridPlaceholderState extends State<GridPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.add,
        size: 250,
      ),
      onPressed: () {
        setState(() {
          cart.add(
            OrderItem(
              name: widget.name,
              nameSubtitle: widget.subName,
              price: widget.price,
              imagePicture: widget.imagePicture,
            ),
          );
          print(cart);
          widget.onPressed(cart);
        });
      },
    );
  }
}
