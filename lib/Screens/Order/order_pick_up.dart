import 'package:coffee_shop/Screens/Order/order_deliver.dart';
import 'package:flutter/material.dart';

class PickUp extends StatefulWidget {
  const PickUp({super.key});

  @override
  State<PickUp> createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Deliver(
          text: 'The Nearest Pick Up',
          subText: 'Street 53, Shubra El Kheima',
          isDeliver: false,
        ),
      ],
    );
  }
}
