import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import statement
import 'package:rekomendasi/pages/my_button.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class AddReviews extends StatefulWidget {
  final String id;
  final String user;

  const AddReviews({Key? key, required this.id, required this.user}) : super(key: key);

  @override
  State<AddReviews> createState() => _AddReviews();
}

class _AddReviews extends State<AddReviews> {
  final TextEditingController reviewController = TextEditingController();
  late String? id;
  late String? username;
  int rating = 0;

  @override
  void initState() {
    super.initState();
    username = widget.user;
    id = widget.id;
  }

  Future<void> sendReviews(BuildContext context) async {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('dd-MM-yyyy hh:mm a').format(now);
    final String review = reviewController.text;

    final Uri addDataUri = Uri.parse('http://10.0.2.2:5000/add_data');
    try {
      final response = await http.post(
        addDataUri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': id,
          'user': username,
          'rate': rating,
          'date': formattedDate,
          'reviews': review
        }),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text(jsonData['message']),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to add product: ${response.reasonPhrase}'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred: $e'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
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
                onRatingUpdate: (newRating) {
                  setState(() {
                    rating = newRating.toInt();
                  });
                },
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Write Your Review',
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.bold),
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
