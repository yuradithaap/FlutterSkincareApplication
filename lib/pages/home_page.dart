import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import statement
import 'package:skincare/pages/skincare.dart';
import 'package:skincare/pages/skincare_tile.dart';
import 'package:skincare/pages/skincare_type.dart';
import 'package:skincare/pages/skincare_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List skincare = [
    Skincare(
        name: 'Acne B5',
        category: 'Serum',
        price: '120.000',
        image: 'lib/images/serum.png',
        rating: '4.9'),
    Skincare(
        name: 'Perfect B5',
        category: 'Serum',
        price: '120.000',
        image: 'lib/images/serum.png',
        rating: '4.0'),
    Skincare(
        name: 'Wrinkles B5',
        category: 'Serum',
        price: '120.000',
        image: 'lib/images/serum.png',
        rating: '5.0')
  ];

  final List type = [
    ['Rekomendasi', true],
    ['Face Wash', false],
    ['Toner', false],
    ['Serum', false],
    ['Moisturizer', false],
    ['Sunscreen', false],
  ];

  void skincareTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < type.length; i++) {
        type[i][1] = false;
      }
      type[index][1] = true;
    });
  }

  void navigateToProductDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SkincareDetailPage(
          skincare: skincare[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfffde1e1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff925857),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Find the best skincare product for your skin!',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: const Color(0xff925857),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search Anything Here',
                  hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff925857)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff925857)),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: type.length,
                itemBuilder: (context, index) {
                  return SkincareType(
                    type: type[index][0],
                    isSelected: type[index][1],
                    onTap: () {
                      skincareTypeSelected(index);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.65, // Adjust the aspect ratio
                ),
                itemCount: skincare.length,
                itemBuilder: (context, index) => SkincareTile(
                  skincare: skincare[index],
                  onTap: () => navigateToProductDetails(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
