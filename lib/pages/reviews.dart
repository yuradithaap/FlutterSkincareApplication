import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:skincare/pages/reviewsModal.dart';
import 'package:skincare/pages/reviewsUI.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  bool isMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffde1e1),
      appBar: AppBar(
        backgroundColor: const Color(0xff925857),
        elevation: 0,
        foregroundColor: const Color(0xfffde1e1),
        title: Text(
          'Reviews',
          style: GoogleFonts.poppins().copyWith(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Align(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: '4.5',
                              style: TextStyle(fontSize: 48),
                            ),
                            TextSpan(
                              text: '/5',
                              style: TextStyle(fontSize: 24, color: Colors.grey[500]),
                            )
                          ],
                        ),
                      ),
                    ),
                    RatingBarIndicator(
                      rating: 4.5,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 28.0,
                      unratedColor: Colors.grey[500],
                      direction: Axis.horizontal,
                    ),
                    Text(
                      '${ReviewsList.length} Reviews',
                      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              itemCount: ReviewsList.length,
              itemBuilder: (context, index) {
                return ReviewUI(
                  image: ReviewsList[index].image,
                  name: ReviewsList[index].name,
                  date: ReviewsList[index].date,
                  comment: ReviewsList[index].comment,
                  rating: ReviewsList[index].rating,
                  isLess: isMore,
                  onTap: () => setState(() {
                    isMore = !isMore;
                  }),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ),
        ],
      ),
    );
  }
}
