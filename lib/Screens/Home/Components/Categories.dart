import 'package:coffee_shop/Screens/Order/order_components.dart';
import 'package:coffee_shop/colors_and_constants.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedItem = 0;

  Widget buildCategories() {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ['Cappuccino', 'Machiato', 'Latte']
          .asMap()
          .map(
            (key, value) => MapEntry(
              key,
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItem = key;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.047,
                  width: screenWidth * 0.25,
                  decoration: BoxDecoration(
                      color: selectedItem == key
                          ? MyColors().myBrown
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: MyText(
                    text: value,
                    color: selectedItem == key
                        ? Colors.white
                        : MyColors().textBlack,
                    size: 12,
                    isBold: true,
                  ),
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildCategories();
  }
}
