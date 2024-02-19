import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.85,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (val) {
          if (val == null || val.isEmpty) return 'Please fill the field';
          if (hintText == 'Password') {
            return (val.toLowerCase() != 'mars.teamwork()')
                ? ('$hintText is incorrect')
                : (null);
          } else {
            return (val.toLowerCase() != 'mars')
                ? ('$hintText is incorrect')
                : (null);
          }
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
