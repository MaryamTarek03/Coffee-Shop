import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors_and_constants.dart';
import '../../Order/order_components.dart';
import '../Components/Categories.dart';
import '../Components/GridView_Component.dart';

class NavHome extends StatelessWidget {
  const NavHome({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(color: Color(0xff1C1C1C)),
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: screenWidth * 0.85,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: 'Location',
                                  color: MyColors().textGrey,
                                  isBold: false,
                                  size: 16,
                                ),
                                const MyText(
                                  text: 'Cairo, Egypt',
                                  color: Colors.white,
                                  isBold: true,
                                  size: 18,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/pictures/HomeProfile.png',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: screenHeight * 0.064,
                        width: screenWidth * 0.85,
                        child: TextFormField(
                          style: GoogleFonts.sora(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xff313131),
                            hintText: 'Search coffee',
                            hintStyle: GoogleFonts.sora(
                              color: MyColors().textGrey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -80,
                top: 240,
                left: 0,
                right: 0,
                child: Image(
                  image: const AssetImage('assets/pictures/HomePromo.png'),
                  width: screenWidth * 0.85,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            width: screenWidth * 0.85,
            alignment: Alignment.topLeft,
            child: const Categories(),
          ),
          SizedBox(
            width: screenWidth * 0.85,
            child: const CustomGridView(),
          ),
        ],
      ),
    );
  }
}
