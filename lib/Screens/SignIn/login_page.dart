import 'package:coffee_shop/Screens/Home/HomePage.dart';
import 'package:coffee_shop/Screens/Order/order_components.dart';
import 'package:coffee_shop/Screens/SignIn/square_tile.dart';
import 'package:coffee_shop/colors_and_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'my_textfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    void signUserIn() {
      if (_formKey.currentState!.validate()) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/pictures/coffeeIdle.json',
                  height: screenHeight * 0.25,
                ),

                // welcome back, you've been missed!
                MyText(
                  text: 'Welcome back you\'ve been missed!',
                  size: 16,
                  isBold: true,
                  color: MyColors().textBlack,
                ),

                const SizedBox(height: 25),

                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: screenWidth * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: MyText(
                          text: 'Forgot Password?',
                          color: MyColors().textGrey,
                          isBold: false,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                CoffeeButton(
                  text: 'Sign In',
                  onPressed: signUserIn,
                ),

                const SizedBox(height: 25),

                // or continue with
                SizedBox(
                  width: screenWidth * 0.85,
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: MyText(
                          text: 'Or continue with',
                          color: MyColors().textGrey,
                          size: 14,
                          isBold: true,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                      imagePath: 'assets/icons/appleLogo2.png',
                    ),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(
                      imagePath: 'assets/icons/googleLogo.webp',
                    )
                  ],
                ),

                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: 'Not a member?',
                      size: 12,
                      isBold: false,
                      color: MyColors().textGrey,
                    ),
                    const SizedBox(width: 4),

                    //TODO Navigate to Sign Up
                    InkWell(
                      onTap: () {},
                      child: const MyText(
                        text: 'Register now',
                        size: 12,
                        isBold: true,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
