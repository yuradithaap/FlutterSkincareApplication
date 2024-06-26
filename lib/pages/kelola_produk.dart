import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rekomendasi/pages/productModal.dart';
import 'package:rekomendasi/services/product_services.dart'; // Import your ProductService
import 'package:rekomendasi/pages/add_product.dart'; // Import AddProductPage

class KelolaProduk extends StatefulWidget {
  const KelolaProduk({Key? key});

  @override
  State<KelolaProduk> createState() => _KelolaProdukState();
}

class _KelolaProdukState extends State<KelolaProduk> {
  List<Product> productList = []; // List to hold products
  String selectedCategory = 'Facewash';

  @override
  void initState() {
    super.initState();
    _fetchProducts(
        selectedCategory); // Fetch products for the initial selected category
  }

  Future<void> _fetchProducts(String category) async {
    try {
      ProductService productService = ProductService();
      List<Product> products = await productService.fetchProduct(category);
      setState(() {
        productList = products; // Update productList with fetched products
      });
    } catch (e) {
      print('Error fetching products: $e');
      // Handle error
    }
  }

  Future<void> _deleteProduct(int productId) async {
    try {
      ProductService productService = ProductService();
      bool success = await productService.deleteProduct(productId);
      if (success) {
        _fetchProducts(selectedCategory);
      }
    } catch (e) {
      print('Error deleting product: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffde1e1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddProductForm(
                              onProductAdded: (String category) {
                                _fetchProducts(category);
                              },
                            ),
                          ),
                        );
                      },
                      child: Text('Add Product'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff925857), // background color
                        foregroundColor: Color(0xfffde1e1), // foreground color
                      ),
                    ),
                    SizedBox(
                        width:
                            20), // Add some space between button and dropdown
                    DropdownButton<String>(
                      value: selectedCategory,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                          _fetchProducts(
                              selectedCategory); // Fetch products for the selected category
                        });
                      },
                      items: <String>[
                        'Facewash',
                        'Toner',
                        'Serum',
                        'Moisturizer',
                        'Sunscreen',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: GoogleFonts.poppins()),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                    height: 20), // Add some space between dropdown and table
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 20.0,
                    horizontalMargin: 10.0,
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xff925857)),
                    headingTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    dataRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.grey[100]!),
                    dataTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                    columns: [
                      DataColumn(
                          label: Text('ID', style: GoogleFonts.poppins())),
                      DataColumn(
                          label:
                              Text('Category', style: GoogleFonts.poppins())),
                      DataColumn(
                          label: Text('Brand', style: GoogleFonts.poppins())),
                      DataColumn(
                          label: Text('Name', style: GoogleFonts.poppins())),
                      DataColumn(
                          label: Text('Image', style: GoogleFonts.poppins())),
                      DataColumn(
                          label: Text('Price', style: GoogleFonts.poppins())),
                      DataColumn(
                          label: Text('Rating', style: GoogleFonts.poppins())),
                      DataColumn(
                          label: Text('Positif', style: GoogleFonts.poppins())),
                      DataColumn(
                          label: Text('Desc', style: GoogleFonts.poppins())),
                      DataColumn(
                          label: Text('Action', style: GoogleFonts.poppins())),
                    ],
                    rows: productList.map((product) {
                      return DataRow(
                        cells: [
                          DataCell(Text(product.id.toString(),
                              style: GoogleFonts.poppins())),
                          DataCell(Text(product.category ?? 'Unknown Category',
                              style: GoogleFonts.poppins())),
                          DataCell(Text(product.brand ?? 'Unknown Brand',
                              style: GoogleFonts.poppins())),
                          DataCell(Text(product.name ?? 'Unknown Name',
                              style: GoogleFonts.poppins())),
                          DataCell(Text(product.image ?? 'Unknown Image',
                              style: GoogleFonts.poppins())),
                          DataCell(Text(product.price.toString(),
                              style: GoogleFonts.poppins())),
                          DataCell(Text(product.rating.toString(),
                              style: GoogleFonts.poppins())),
                          DataCell(Text(product.positif ?? 'Unknown Positif',
                              style: GoogleFonts.poppins())),
                          DataCell(
                            Text(
                              product.desc ?? 'Unknown Desc',
                              style: GoogleFonts.poppins(),
                              overflow: TextOverflow
                                  .ellipsis, // Add ellipsis if the text overflows
                              maxLines: 1, // Limit to one line
                            ),
                          ),
                          DataCell(
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deleteProduct(product.id ?? 0);
                              },
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
