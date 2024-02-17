import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedItem = 0;
  Widget buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['Cappuccino', 'Machiato', 'Latte']
          .asMap()
          .map((key, value) => MapEntry(
              key,
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItem = key;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: selectedItem == key
                          ? const Color(0xffC77B51)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    value,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            selectedItem == key ? Colors.white : Colors.black),
                  ),
                ),
              )))
          .values
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildCategories();
  }
}
