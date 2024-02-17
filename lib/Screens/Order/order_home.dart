import 'package:coffee_shop/Screens/Order/Components/order_item.dart';
import 'package:coffee_shop/Screens/Order/grid_item_placeholder.dart';
import 'package:coffee_shop/Screens/Order/order_components.dart';
import 'package:coffee_shop/Screens/Order/testing.dart';
import 'package:coffee_shop/colors_and_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Components/list_of_orders.dart';
import 'order_deliver.dart';
import 'order_pick_up.dart';

class OrderHome extends StatefulWidget {
  OrderHome({super.key});

  @override
  State<OrderHome> createState() => _OrderHomeState();
}

class _OrderHomeState extends State<OrderHome> {
  void updateListOfOrders(List<Widget> newOrderItemList) {
    setState(() {
      orderedItemsList = newOrderItemList;
    });
  }

  double priceTotal = 0;

  // void updatePrice() {
  //   for (OrderItem element in orderedItemsList) {
  //     setState(() {
  //       priceTotal += element.getTotalPrice();
  //     });
  //   }
  // }

  int selectedIndex = 1;
  int countNumber = 1;
  final double price = 4.53;
  final String name = 'Cappuccino';
  final String nameSubtitle = 'with Chocolate';
  final String imagePicture = 'assets/pictures/HomeCoffee1.png';

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const PickUp(),
      const Deliver(
        text: 'Delivery Address',
        subText: 'House No. 25, Shubra El Kheima',
        isDeliver: true,
      ),
    ];

    final String totalPrice =
        (price * countNumber + selectedIndex).toStringAsFixed(2);

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Padding(
          padding: EdgeInsets.only(left: screenSize.width * 0.075),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Order',
          style: GoogleFonts.sora(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // GridPlaceholder(onPressed: update),
              // TestingWidget(onPressed: update),
              Container(
                width: screenSize.width * 0.85,
                height: screenSize.height * 0.06,
                padding: const EdgeInsets.symmetric(
                  horizontal: 3,
                ),
                decoration: BoxDecoration(
                  color: MyColors().myGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    swapPages(
                      screenSize.width * 0.42,
                      screenSize.height * 0.05,
                      1,
                      'Deliver',
                    ),
                    swapPages(
                      screenSize.width * 0.41,
                      screenSize.height * 0.05,
                      0,
                      'Pick Up',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.85,
                child: pages[selectedIndex],
              ),
              //TODO: delete this container AND FIX PRICES
              Container(
                alignment: Alignment.topLeft,
                width: screenSize.width * 0.85,
                height: screenSize.height * 0.066,
                child: SizedBox(
                  width: screenSize.width * 0.85,
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(imagePicture),
                        width: screenSize.width * 0.144,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text: name,
                            color: MyColors().textBlack,
                            isBold: true,
                            size: 16,
                          ),
                          MyText(
                            text: nameSubtitle,
                            color: MyColors().textGrey,
                            isBold: false,
                            size: 12,
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: screenSize.height * 0.0344,
                        child: Row(
                          children: [
                            myIconButton('-'),
                            SizedBox(
                              width: 35,
                              child: Center(
                                child: MyText(
                                  text: '$countNumber',
                                  color: MyColors().textBlack,
                                  isBold: true,
                                  size: 14,
                                ),
                              ),
                            ),
                            myIconButton('+'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: orderedItemsList,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 5,
                width: double.infinity,
                color: MyColors().myGrey,
              ),
              Container(
                width: screenSize.width * 0.85,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: selectedIndex == 1 ? true : false,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.all(15),
                        width: screenSize.width * 0.85,
                        height: screenSize.height * 0.069,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 2,
                            color: MyColors().myGrey,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image:
                                  const AssetImage('assets/icons/Discount.png'),
                              width: screenSize.width * 0.05,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            MyText(
                              text: '1 Discount is applied',
                              size: 16,
                              isBold: true,
                              color: MyColors().textBlack,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: MyColors().textBlack,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyText(
                      text: 'Payment Summary',
                      size: 16,
                      isBold: true,
                      color: MyColors().textBlack,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        MyText(
                          text: 'Price',
                          size: 14,
                          isBold: false,
                          color: MyColors().textBlack,
                        ),
                        const Spacer(),
                        MyText(
                          text: '\$ $price',
                          size: 14,
                          isBold: true,
                          color: MyColors().textBlack,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        MyText(
                          text: 'Delivery Fee',
                          size: 14,
                          isBold: false,
                          color: MyColors().textBlack,
                        ),
                        const Spacer(),
                        Text(
                          '\$ 2.0  ',
                          style: GoogleFonts.sora(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        MyText(
                          text: '\$ ${selectedIndex.toDouble()}',
                          size: 14,
                          isBold: true,
                          color: MyColors().textBlack,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 2,
                      width: screenSize.width * 0.85,
                      color: MyColors().myGrey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        children: [
                          MyText(
                            text: 'Total Payment',
                            size: 14,
                            isBold: false,
                            color: MyColors().textBlack,
                          ),
                          const Spacer(),
                          MyText(
                            text: '\$ $totalPrice',
                            size: 14,
                            isBold: true,
                            color: MyColors().textBlack,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 15,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: Container(
          height: screenSize.height * 0.2,
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
              child: SizedBox(
                width: screenSize.width * 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        ImageIcon(
                          const AssetImage('assets/icons/Cash.png'),
                          color: MyColors().myBrown,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        CashBottomNavigation(cash: totalPrice),
                        const Spacer(),
                        const Icon(Icons.more_horiz),
                      ],
                    ),
                    const CoffeeButton(
                      text: 'Order',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget swapPages(double width, double height, int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color:
              (selectedIndex == index ? MyColors().myBrown : MyColors().myGrey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.sora(
              fontWeight: (selectedIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal),
              fontSize: 16,
              color: (selectedIndex == index ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  //TODO: DELETE THIS TOO
  Widget myIconButton(String sign) {
    return IconButton(
      onPressed: () {
        setState(() {
          sign == '+'
              ? countNumber++
              : countNumber > 0
                  ? countNumber--
                  : countNumber = countNumber;
        });
      },
      icon: Icon(sign == '+' ? Icons.add : Icons.remove),
      iconSize: 16,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          CircleBorder(
            side: BorderSide(
              width: 1,
              color: MyColors().buttonGreyBorder,
            ),
          ),
        ),
      ),
    );
  }
}
