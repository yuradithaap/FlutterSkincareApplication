import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import statement
import 'package:skincare/pages/history_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  final List<HistoryModel> historyProduct = [
    HistoryModel(
      name: 'Serum B5',
      image: 'lib/images/serum.png',
      kategori: 'Serum',
      date: '26 Januari 2024',
      rating: 4.0,
      review: 'This serum works wonders on my skin. Highly recommended!',
    ),
    HistoryModel(
      name: 'Perfect Whip',
      image: 'lib/images/serum.png',
      kategori: 'Face Wash',
      date: '26 Januari 2024',
      rating: 3.0,
      review: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc a auctor odio. Sed mi lectus, viverra eu sem sed, lacinia convallis ipsum. Vestibulum placerat ligula eget tincidunt placerat. Curabitur quis nulla eleifend, mattis neque non, egestas lorem. Morbi laoreet tincidunt ligula, in sollicitudin odio maximus nec. Nullam et ultrices lectus. Aenean consequat dolor ex, in molestie odio porttitor a. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras at posuere diam, a porta sapien. Nulla metus quam, interdum nec diam ac, gravida facilisis magna. Maecenas dui justo, vehicula ullamcorper tristique sit amet, lobortis ac nibh. In id augue facilisis, volutpat purus sit amet, facilisis nisl. Quisque feugiat felis ac consectetur laoreet.',
    ),
    HistoryModel(
      name: 'Skin1004',
      image: 'lib/images/serum.png',
      kategori: 'Moisturizer',
      date: '26 Januari 2024',
      rating: 5.0,
      review: 'Absolutely love this moisturizer! Keeps my skin hydrated all day.',
    )
  ];

  bool isLess = true; // Variable to track whether text is truncated or not

  void onTap() {
    setState(() {
      isLess = !isLess; // Toggle the flag
    });
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
          'History Reviews',
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(bottom: 8, top: 8),
        itemCount: historyProduct.length,
        itemBuilder: (context, index) {
          final product = historyProduct[index];
          return Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: ListTile(
                leading: Image.asset(
                  product.image,
                  width: 50,
                  height: 50,
                ),
                title: Text(
                  product.name,
                  style: GoogleFonts.poppins(),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category: ${product.kategori}',
                      style: GoogleFonts.poppins(),
                    ),
                    Text(
                      'Date: ${product.date}',
                      style: GoogleFonts.poppins(),
                    ),
                    Row(
                      children: [
                        Text(
                          'Rating: ${product.rating}',
                          style: GoogleFonts.poppins(),
                        ),
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                      ],
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: onTap,
                      child: isLess
                          ? Text(
                              'Review: ${product.review}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(fontSize: 14),
                            )
                          : Text(
                              'Review: ${product.review}',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                    ),
                  ],
                ),
                onTap: () {
                  // Handle tapping on a history item if needed
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      ),
    );
  }
}
