import 'package:coffee_shop/Screens/Home/HomePage.dart';
import 'package:coffee_shop/Screens/Order/Components/order_item.dart';
import 'package:coffee_shop/Screens/Order/order_components.dart';
import 'package:coffee_shop/colors_and_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Components/list_of_orders.dart';
import 'order_deliver.dart';
import 'order_pick_up.dart';

class OrderHome extends StatefulWidget {
  OrderHome({super.key, required this.updateIndex});

  final void Function(int) updateIndex;

  @override
  State<OrderHome> createState() => _OrderHomeState();
}

class _OrderHomeState extends State<OrderHome> {
  void updateListOfOrders(List<OrderItem> newOrderItemList) {
    setState(() {
      cart = newOrderItemList;
    });
  }

  // void updatePrice() {
  //   for (OrderItem element in orderedItemsList) {
  //     setState(() {
  //       priceTotal += element.getTotalPrice();
  //     });
  //   }
  // }

  void clearCart() {
    setState(() {
      cart.clear();
      widget.updateIndex(0);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const MyText(
          text: 'Cleared Successfully',
          color: Colors.white,
          isBold: false,
          size: 16,
        ),
        duration: const Duration(milliseconds: 700),
        behavior: SnackBarBehavior.floating,
        backgroundColor: MyColors().myBrown,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }

  double priceTotal = 0;

  int selectedIndex = 1;
  int countNumber = 1;

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

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
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
              ListView.builder(
                itemCount: cart.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Center(
                  child: cart[index],
                ),
              ),
              Visibility(
                visible: cart.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CoffeeButton(text: 'Clear Cart', onPressed: clearCart),
                ),
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
                          text: '\$ 0',
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
                            text: '\$ 0',
                            size: 14,
                            isBold: true,
                            color: MyColors().textBlack,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: CoffeeButton(
                        text: 'Order',
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            elevation: 20,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (context) => Container(
                              height: screenSize.height * 0.2,
                              width: screenSize.width,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            ImageIcon(
                                              const AssetImage(
                                                  'assets/icons/Cash.png'),
                                              color: MyColors().myBrown,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            CashBottomNavigation(
                                              cash: 0.toString(),
                                            ),
                                            const Spacer(),
                                            const Icon(Icons.more_horiz),
                                          ],
                                        ),
                                        CoffeeButton(
                                          text: 'Check Out',
                                          onPressed: () {
                                            setState(() {
                                              cart.clear();
                                              widget.updateIndex(0);
                                            });
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: const MyText(
                                                  text: 'Ordered Successfully',
                                                  color: Colors.white,
                                                  isBold: false,
                                                  size: 16,
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 700),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor:
                                                    MyColors().myBrown,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget swapPages(double width, double height, int index, String text) {
    return InkWell(
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
}
