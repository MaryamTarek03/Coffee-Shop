import 'package:coffee_shop/colors_and_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText(
      {super.key,
      required this.text,
      required this.size,
      required this.isBold,
      required this.color});

  final String text;
  final double size;
  final bool isBold;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sora(
        fontSize: size,
        fontWeight: (isBold ? FontWeight.w600 : FontWeight.normal),
        color: color,
      ),
    );
  }
}

class MiniButton extends StatefulWidget {
  const MiniButton({super.key, required this.icon, required this.text});

  final String icon, text;

  @override
  State<MiniButton> createState() => _MiniButtonState();
}

class _MiniButtonState extends State<MiniButton> {
  Color textColor = MyColors().textBlack;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
        left: 3,
        right: 3,
      ),
      height: screenSize.height * 0.033,
      width: screenSize.width * 0.32,
      child: ElevatedButton(
        onPressed: () {},
        onHover: (isHovered) {
          setState(() {
            textColor = isHovered ? Colors.white : MyColors().textBlack;
          });
        },
        style: ButtonStyle(
          surfaceTintColor: const MaterialStatePropertyAll<Color>(Colors.white),
          backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
          elevation: const MaterialStatePropertyAll<double>(0),
          overlayColor: MaterialStatePropertyAll<Color?>(MyColors().myBrown),
          alignment: Alignment.center,
          iconColor: MaterialStatePropertyAll<Color>(textColor),
          iconSize: const MaterialStatePropertyAll<double>(14),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                width: 1,
                color: MyColors().buttonGreyBorder,
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(widget.icon),
            ),
            const SizedBox(
              width: 7,
            ),
            MyText(
              text: widget.text,
              size: 6,
              isBold: false,
              color: textColor,
            )
          ],
        ),
      ),
    );
  }
}

class CashBottomNavigation extends StatelessWidget {
  const CashBottomNavigation({super.key, required this.cash});

  final String cash;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.3,
      height: screenSize.height * 0.03,
      decoration: BoxDecoration(
        color: MyColors().myGrey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenSize.width * 0.136,
            height: screenSize.height * 0.03,
            decoration: BoxDecoration(
              color: MyColors().myBrown,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                'Cash',
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: screenSize.width * 0.164,
            height: screenSize.height * 0.03,
            decoration: BoxDecoration(
              color: MyColors().myGrey,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                '\$ $cash',
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CoffeeButton extends StatelessWidget {
  const CoffeeButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.85,
      height: screenSize.height * 0.076,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(MyColors().myBrown),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          overlayColor: const MaterialStatePropertyAll(Colors.brown),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        child: MyText(
          text: text,
          size: 16,
          isBold: true,
          color: Colors.white,
        ),
      ),
    );
  }
}
