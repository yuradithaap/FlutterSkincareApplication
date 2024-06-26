import 'package:flutter/material.dart';
import 'package:skincare/pages/skincare.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

class SkincareTile extends StatelessWidget {
  final Skincare skincare;
  final void Function()? onTap;

  const SkincareTile({
    super.key,
    required this.skincare,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;

    // Calculate padding based on screen width
    final double horizontalPadding = screenWidth * 0.05; // 5% of screen width
    final double imagePadding = screenWidth * 0.02; // 2% of screen width

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding, bottom: 20.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: EdgeInsets.only(bottom: imagePadding),
                  child: Image.asset(
                    skincare.image,
                    width: double.infinity, // Make image fill the container width
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Name
                    Text(
                      skincare.name,
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //Category
                    Text(
                      skincare.category,
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                    //Price and Rating
                    SizedBox(
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp.' + skincare.price,
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
                              ),
                              Text(
                                skincare.rating,
                                style: GoogleFonts.poppins().copyWith(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
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
    );
  }
}
