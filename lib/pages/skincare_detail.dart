import 'package:flutter/material.dart';
import 'package:skincare/pages/my_button.dart';
import 'package:skincare/pages/reviewsModal.dart';
import 'package:skincare/pages/reviewsUI.dart';
import 'package:skincare/pages/skincare.dart';
import 'package:skincare/pages/reviews.dart';
import 'package:skincare/pages/add_reviews.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

class SkincareDetailPage extends StatefulWidget {
  final Skincare skincare;
  const SkincareDetailPage({super.key, required this.skincare});

  @override
  State<SkincareDetailPage> createState() => _SkincareDetailPage();
}

class _SkincareDetailPage extends State<SkincareDetailPage> {
  bool isMore = false;

  void addReviews(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
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
          widget.skincare.name,
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
                  Image.asset(
                    widget.skincare.image,
                    height: 200,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.skincare.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.skincare.name,
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.skincare.category,
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rp. ' + widget.skincare.price,
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
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consectetur risus ut arcu pulvinar, ac dapibus risus dignissim. Vivamus placerat, elit ac convallis tempus, magna lorem efficitur risus, nec finibus justo nunc et nisi. Duis pretium libero quis quam efficitur, ac varius libero condimentum. Sed lacinia, nisi vitae interdum volutpat, turpis risus convallis nisi, sed gravida arcu sapien ac metus. Morbi pharetra felis eu libero finibus fringilla. In hac habitasse platea dictumst. Quisque in nulla ac odio scelerisque scelerisque non at tortor. Duis sit amet augue ut magna volutpat feugiat nec vel lorem. Donec in suscipit justo. Sed sollicitudin nunc in turpis suscipit tempor. Vivamus ultrices metus at leo rhoncus, eget rhoncus nulla iaculis.",
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.grey[600],
                              fontSize: 16,
                              height: 2,
                            ),
                          )
                        : Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consectetur risus ut arcu pulvinar, ac dapibus risus dignissim. Vivamus placerat, elit ac convallis tempus, magna lorem efficitur risus, nec finibus justo nunc et nisi. Duis pretium libero quis quam efficitur, ac varius libero condimentum. Sed lacinia, nisi vitae interdum volutpat, turpis risus convallis nisi, sed gravida arcu sapien ac metus. Morbi pharetra felis eu libero finibus fringilla. In hac habitasse platea dictumst. Quisque in nulla ac odio scelerisque scelerisque non at tortor. Duis sit amet augue ut magna volutpat feugiat nec vel lorem. Donec in suscipit justo. Sed sollicitudin nunc in turpis suscipit tempor. Vivamus ultrices metus at leo rhoncus, eget rhoncus nulla iaculis.',
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
                          MaterialPageRoute(builder: (context) => Reviews()),
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
                  ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    itemCount: 3,
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
                    MaterialPageRoute(builder: (context) => AddReviews()),
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
