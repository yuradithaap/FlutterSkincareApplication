import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

class ReviewUI extends StatelessWidget {
  final String image, name, date, comment;
  final double rating;
  final VoidCallback onTap;
  final bool isLess;

  const ReviewUI({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    required this.comment,
    required this.rating,
    required this.onTap,
    required this.isLess,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 45.0,
                width: 45.0,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  name,
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              RatingBarIndicator(
                rating: rating,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Color(0xff925857),
                ),
                itemCount: 5,
                itemSize: 25.0,
                unratedColor: Colors.grey[500],
                direction: Axis.horizontal,
              ),
              const SizedBox(width: 8.0),
              Text(
                date,
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: isLess
                ? Text(
                    comment,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 18.0,
                      color: Colors.grey[900],
                    ),
                  )
                : Text(
                    comment,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 18.0,
                      color: Colors.grey[900],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
