import 'package:flutter/material.dart';
import 'package:rekomendasi/pages/my_button.dart';
import 'package:rekomendasi/pages/productModal.dart';
import 'package:rekomendasi/pages/reviews.dart';
import 'package:rekomendasi/pages/add_reviews.dart';
import 'package:google_fonts/google_fonts.dart'; 

class DetailProducts extends StatefulWidget {
  final Product product;
  final String user;

  const DetailProducts({Key? key, required this.product, required this.user});

  @override
  State<DetailProducts> createState() => _DetailProduct();
}

class _DetailProduct extends State<DetailProducts> {
  bool isMore = false;

  late String? id;
  late String? user;
  double rating = 0;

  @override
  void initState() {
    super.initState();
    user = widget.user;
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
          widget.product.name ?? '',
          style: GoogleFonts.poppins().copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Image(
                      image: AssetImage('lib/images/${widget.product.image}'),
                      width: 200,
                      height: 250,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.product.rating.toString(),
                      ),
                      Icon(Icons.star, size: 16, color: Colors.amber),
                      Row(
                        children: [
                          Text(
                            widget.product.positif ?? '',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Icon(
                            Icons.thumb_up,
                            size: 16,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.name ?? '',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.product.category ?? '',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rp. ' + widget.product.price.toString(),
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Description',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 8, top: 5),
                    child: isMore
                        ? Text(
                            widget.product.desc??'Unknown Desc',
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.grey[600],
                              fontSize: 16,
                              height: 2,
                            ),
                          )
                        : Text(
                            widget.product.desc??'Unknown Desc',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.grey[600],
                              fontSize: 16,
                              height: 2,
                            ),
                          ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      isMore = !isMore;
                    }),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          isMore ? "View Less" : "View More",
                          style: GoogleFonts.poppins().copyWith(
                            color: const Color(0xff925857),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: GoogleFonts.poppins().copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  Reviews(id: widget.product.id.toString(), rating: widget.product.rating ?? 0,)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            'View All',
                            style: GoogleFonts.poppins().copyWith(
                              color: const Color(0xff925857),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xff925857),
            child: Column(
              children: [
                MyButton(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddReviews(id: widget.product.id.toString(), user: widget.user,)),
                  ),
                  text: 'Add Review',
                  textColor: 0xfffde1e1,
                  backColor: 0x80925857,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
