import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

class SkincareType extends StatelessWidget{
  final String type;
  final bool isSelected;
  final VoidCallback onTap; 

  const SkincareType({super.key, 
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override 
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          type,
          style: GoogleFonts.poppins().copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: isSelected ? const Color(0xff925857) : Colors.grey,
          ),
        ),
      ),
    );
  }
}
