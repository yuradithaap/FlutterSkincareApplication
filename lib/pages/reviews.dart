import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rekomendasi/services/review_services.dart';
import 'package:rekomendasi/pages/reviewsProduct.dart';

class Reviews extends StatefulWidget {
  final String id;
  final double rating;

  const Reviews({Key? key, required this.id, required this.rating}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  List<ReviewsProduct> reviewsList = [];
  bool isMore = false;

  @override
  void initState() {
    super.initState();
    _fetchReviews(widget.id);
  }

  Future<void> _fetchReviews(String id) async {
    try {
      ReviewService reviewService = ReviewService();
      List<ReviewsProduct> reviews = await reviewService.fetchReviews(id);
      setState(() {
        reviewsList = reviews;
      });
    } catch (e) {
      print("Error fetching reviews: $e");
    }
  }

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
                            TextSpan(
                              text: widget.rating.toString(),
                              style: TextStyle(fontSize: 48),
                            ),
                            TextSpan(
                              text: '/5',
                              style: TextStyle(
                                  fontSize: 24, color: Colors.grey[500]),
                            )
                          ],
                        ),
                      ),
                    ),
                    RatingBarIndicator(
                      rating: widget.rating,
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
                      '${reviewsList.length} Reviews',
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
              itemCount: reviewsList.length,
              itemBuilder: (context, index) {
                return ReviewUI(
                  reviewsProduct: reviewsList[index],
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

class ReviewUI extends StatelessWidget {
  final ReviewsProduct reviewsProduct;
  final bool isLess;
  final VoidCallback onTap;

  const ReviewUI({
    Key? key,
    required this.reviewsProduct,
    required this.isLess,
    required this.onTap,
  }) : super(key: key);

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
                height: 30.0,
                width: 30.0,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Make the container circular
                  image: DecorationImage(
                    image: AssetImage('lib/images/default.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  reviewsProduct.user ?? 'Unknown User',
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
                rating: reviewsProduct.rate ?? 0.0,
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
                reviewsProduct.date ?? 'Unknown Date',
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
                    reviewsProduct.reviews ?? 'Unknown Reviews',
                    maxLines: 100,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 18.0,
                      color: Colors.grey[900],
                    ),
                  )
                : Text(
                    reviewsProduct.reviews ?? 'Unknown Reviews',
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
