import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import statement
import 'package:skincare/pages/add_product.dart';
import 'package:skincare/pages/productModal.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  final List<Product> productList = [
    Product(
      name: 'Serum B5',
      kategori: 'Serum',
      rating: 4.0,
      price: 120000,
      image: 'lib/images/serum.png',
      desc: 'Good for acne skin',
    ),
    Product(
      name: 'Serum B5',
      kategori: 'Serum',
      rating: 4.0,
      price: 120000,
      image: 'lib/images/serum.png',
      desc: 'Good for acne skin',
    ),
    Product(
      name: 'Serum B5',
      kategori: 'Serum',
      rating: 4.0,
      price: 120000,
      image: 'lib/images/serum.png',
      desc: 'Good for acne skin',
    ),
    Product(
      name: 'Serum B5',
      kategori: 'Serum',
      rating: 4.0,
      price: 120000,
      image: 'lib/images/serum.png',
      desc: 'Good for acne skin',
    ),
    Product(
      name: 'Serum B5',
      kategori: 'Serum',
      rating: 4.0,
      price: 120000,
      image: 'lib/images/serum.png',
      desc: 'Good for acne skin',
    ),
  ];

  String selectedCategory = 'Face Wash'; // Default selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffde1e1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff925857),
        foregroundColor: const Color(0xfffde1e1),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Admin', 
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding:
              const EdgeInsets.all(20.0), // Add padding to the entire content
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align content to the start
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProductForm()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(const Color(0xff925857)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
                    ),
                    child: Text('Add Product', style: GoogleFonts.poppins()),
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Text('Category: ', style: GoogleFonts.poppins()),
                      DropdownButton<String>(
                        value: selectedCategory,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                          });
                        },
                        items: [
                          'Serum',
                          'Face Wash',
                          'Toner',
                          'Moisturizer',
                          'Sunscreen'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: GoogleFonts.poppins()),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                  height: 20), // Add space between the Row and the DataTable
              DataTable(
                columnSpacing: 20.0, // Adjust column spacing
                horizontalMargin: 10.0, // Adjust horizontal margin
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xff925857), // Color for header row
                ),
                headingTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                dataRowColor: MaterialStateColor.resolveWith(
                  (states) => Colors.grey[100]!, // Color for data rows
                ),
                dataTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                columns: [
                  DataColumn(
                    label: Text('Nama', style: GoogleFonts.poppins()),
                  ),
                  DataColumn(label: Text('Kategori', style: GoogleFonts.poppins())),
                  DataColumn(label: Text('Rating', style: GoogleFonts.poppins())),
                  DataColumn(label: Text('Harga', style: GoogleFonts.poppins())),
                  DataColumn(label: Text('Deskripsi', style: GoogleFonts.poppins())),
                  DataColumn(label: Text('Gambar', style: GoogleFonts.poppins())),
                  DataColumn(label: Text('Aksi', style: GoogleFonts.poppins())),
                ],
                rows: productList
                    .where((product) =>
                        selectedCategory == product.kategori ||
                        product.kategori == selectedCategory)
                    .map((product) {
                  return DataRow(
                    cells: [
                      DataCell(Text(product.name, style: GoogleFonts.poppins())),
                      DataCell(Text(product.kategori, style: GoogleFonts.poppins())),
                      DataCell(Text(product.rating.toString(), style: GoogleFonts.poppins())),
                      DataCell(Text(product.price.toString(), style: GoogleFonts.poppins())),
                      DataCell(Text(product.desc, style: GoogleFonts.poppins())),
                      DataCell(Image.asset(
                        product.image,
                        height: 30,
                        width: 30,
                      )),
                      DataCell(Text('Some Action', style: GoogleFonts.poppins())),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
