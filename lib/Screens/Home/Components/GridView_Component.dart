import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/CoffeeModel.dart';
import 'Coffee_Data.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({super.key});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: coffeelist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 15),
          itemBuilder: (context, index) {
            CoffeeModel coffeeModel = coffeelist[index];
            return coffee(coffeeModel);
          }),
    ));
  }

  Widget coffee(CoffeeModel coffeeModel) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(coffeeModel.imgPath),
                  fit: BoxFit.cover,
                )),
            child: Row(
              children: [
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 25,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        coffeeModel.rate.toString(),
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffeeModel.name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${coffeeModel.price}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffC77B51),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
