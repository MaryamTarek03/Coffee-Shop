import 'package:coffee_shop/Components/BottomNavBar.dart';
import 'package:coffee_shop/Components/Categories.dart';
import 'package:coffee_shop/Components/GridView_Component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: Column(
        children: [
          Stack(
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
                      Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                'Rohini, New Delhi',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
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
                                        'assets/pictures/HomeProfile.png'))),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              prefix: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: const Color(0xff313131),
                              hintText: 'Search coffee',
                              hintStyle: const TextStyle(color: Colors.grey)),
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
                child: Container(
                  // width: double.infinity,
                  // height: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/pictures/HomePromo.png'),
                  )),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          const Categories(),
          const CustomGridView(),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
