import 'package:coffee_shop/Screens/Order/order_components.dart';
import 'package:coffee_shop/colors_and_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Order/Components/list_of_orders.dart';
import '../../Order/Components/order_item.dart';
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
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: coffeeList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        mainAxisExtent: screenHeight * 0.34,
      ),
      itemBuilder: (context, index) {
        CoffeeModel coffeeModel = coffeeList[index];
        return Coffee(
          coffeeModel: coffeeModel,
          onPressed: (List) {},
        );
      },
    );
  }
}

class Coffee extends StatefulWidget {
  const Coffee({super.key, required this.coffeeModel, required this.onPressed});

  final CoffeeModel coffeeModel;
  final void Function(List<Widget>) onPressed;

  @override
  State<Coffee> createState() => _CoffeeState();
}

class _CoffeeState extends State<Coffee> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.3,
      width: screenWidth * 0.4,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.2,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.coffeeModel.imgPath),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 13,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              widget.coffeeModel.rate.toString(),
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.coffeeModel.name,
                      style: GoogleFonts.sora(
                        color: MyColors().textBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    MyText(
                      text: widget.coffeeModel.subName,
                      size: 14,
                      isBold: false,
                      color: MyColors().textGrey,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${widget.coffeeModel.price.toStringAsFixed(2)}',
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              cart.add(
                                OrderItem(
                                  name: widget.coffeeModel.name,
                                  nameSubtitle: widget.coffeeModel.subName,
                                  price: widget.coffeeModel.price,
                                  imagePicture: widget.coffeeModel.imgPath,
                                ),
                              );
                              print(cart);
                              widget.onPressed(cart);
                            });
                          },
                          child: Container(
                            height: screenHeight * 0.04,
                            width: screenWidth * 0.075,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: MyColors().myBrown,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
