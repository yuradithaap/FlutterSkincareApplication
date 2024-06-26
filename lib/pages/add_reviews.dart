import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import statement
import 'package:skincare/pages/my_button.dart';

class AddReviews extends StatefulWidget {
  const AddReviews({super.key});

  @override
  State<AddReviews> createState() => _AddReviews();
}

class _AddReviews extends State<AddReviews> {
  final reviewController = TextEditingController();

  void sendReviews(BuildContext context){
  Navigator.popUntil(context, ModalRoute.withName('/'));
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
          'Add A Reviews',
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Center(
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                maxRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Color(0xff925857),
                  size: 100,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Write Your Review',
              style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: reviewController,
              maxLines: 4,
              decoration: InputDecoration(
                fillColor: const Color(0x80FFFFFF),
                filled: true,
                hintText: 'Please write your opinion about your product!',
                hintStyle: TextStyle(color: Colors.grey[500]),
              ),
            ),
            const SizedBox(height: 25),
            MyButton(
              onTap: () => sendReviews(context), 
              text: 'Send Reviews', 
              backColor: 0xff925857, 
              textColor: 0xfffde1e1,
              ),
          ],
        ),
      ),
    );
  }
}
