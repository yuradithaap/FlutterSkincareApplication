import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rekomendasi/pages/reviewsProduct.dart';
import 'package:rekomendasi/services/review_services.dart';

class History extends StatefulWidget {
  final String username;

  History({required this.username});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late Future<List<ReviewsProduct>> _reviewsFuture;
  bool isLess = true;

  @override
  void initState() {
    super.initState();
    _reviewsFuture = _fetchHistory(widget.username);
  }

  Future<List<ReviewsProduct>> _fetchHistory(String user) async {
    try {
      ReviewService reviewService = ReviewService();
      return await reviewService.fetchHistory(user);
    } catch (e) {
      print("Error fetching reviews: $e");
      throw e;
    }
  }

  void onTap() {
    setState(() {
      isLess = !isLess;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffde1e1),
      appBar: AppBar(
        backgroundColor: const Color(0xff925857),
        foregroundColor: const Color(0xff925857),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'History Reviews',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xfffde1e1),
          ),
        ),
      ),
      body: FutureBuilder<List<ReviewsProduct>>(
        future: _reviewsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // status data berhasil dimuat atau tidak (untuk loading)
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final reviewsList = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              itemCount: reviewsList.length,
              itemBuilder: (context, index) {
                final history = reviewsList[index];
                return Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: ListTile(
                      leading: Image.asset(
                        'lib/images/' + (history.image ?? 'Unknown Image'),
                        width: 50,
                        height: 50,
                      ),
                      title: Text(
                        history.name ?? 'Unknown Name',
                        style: GoogleFonts.poppins(),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date: ${history.date}',
                            style: GoogleFonts.poppins(),
                          ),
                          Row(
                            children: [
                              Text(
                                'Rating: ${history.rate}',
                                style: GoogleFonts.poppins(),
                              ),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 20),
                            ],
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: onTap,
                            child: isLess
                                ? Text(
                                    'Review: ${history.reviews}',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  )
                                : Text(
                                    'Review: ${history.reviews}',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            );
          }
        },
      ),
    );
  }
}
