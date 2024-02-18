import 'package:coffee_shop/Screens/Order/order_components.dart';
import 'package:flutter/material.dart';

import '../../colors_and_constants.dart';

class Deliver extends StatefulWidget {
  const Deliver({
    super.key,
    required this.text,
    required this.isDeliver,
    required this.subText,
  });

  final String text;
  final String subText;
  final bool isDeliver;

  @override
  State<Deliver> createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: widget.text,
            size: 16,
            isBold: true,
            color: MyColors().textBlack,
          ),
          const SizedBox(
            height: 10,
          ),
          MyText(
            text: 'Cairo, Egypt',
            size: 14,
            isBold: true,
            color: MyColors().textBlack,
          ),
          const SizedBox(
            height: 5,
          ),
          MyText(
            text: widget.subText,
            size: 12,
            isBold: false,
            color: MyColors().textGrey,
          ),
          Row(
            children: [
              Visibility(
                visible: widget.isDeliver,
                child: const MiniButton(
                  text: 'Edit Address',
                  icon: 'assets/icons/EditAddress.png',
                ),
              ),
              Visibility(
                visible: widget.isDeliver,
                child: const SizedBox(
                  width: 7,
                ),
              ),
              const MiniButton(
                text: 'Add Note',
                icon: 'assets/icons/AddNote.png',
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            height: 2,
            width: double.infinity,
            color: MyColors().myGrey,
          ),
        ],
      ),
    );
  }
}
