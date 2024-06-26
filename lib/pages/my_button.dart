import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import statement

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final int backColor;
  final int textColor;

  const MyButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.backColor,
    required this.textColor,
  }) : super(key: key); // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color(backColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Color(textColor),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

