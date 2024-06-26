import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rekomendasi/pages/productModal.dart';
import 'package:rekomendasi/services/product_services.dart';
import 'package:rekomendasi/pages/detail_product.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String username;

  HomePage({required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // mengelola state dari homepage agar dapat berubah
  List<Product> productList = [];
  // list dengan elemen bertipe product
  List<Product> recommendedProduct = [];
  int currentIndex = 0;
  String selectedCategory = 'Rekomendasi';
  late String userId;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    userId = widget.username;
    _fetchProducts(selectedCategory);
    _fetchPredict(userId);
  }

  Future<void> _fetchProducts(String category) async {
    try {
      ProductService productService = ProductService();
      List<Product> products = await productService.fetchProduct(category);
      setState(() {
        productList = products;
      });
      // membuat fungsi untuk mengubah widget
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  Future<void> _fetchPredict(String userId) async {
    setState(() {
      isLoading = true;
    });
    try {
      ProductService productService = ProductService();
      List<Product> products = await productService.fetchPredict(userId);
      setState(() {
        recommendedProduct = products;
        isLoading = false;
      });
      // membuat fungsi untuk mengubah widget
    } catch (e) {
      print("Error fetching predictions: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  final List<String> categories = [
    'Rekomendasi',
    'Facewash',
    'Toner',
    'Serum',
    'Moisturizer',
    'Sunscreen',
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfffde1e1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              // padding : jarak di sekitar widget
              child: Text(
                'Find the best skincare product for ${widget.username} skin!',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: const Color(0xff925857),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, bottom: 10.0, top: 10.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xff925857),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                      if (selectedCategory == 'Rekomendasi') {
                        _fetchPredict(userId);
                      } else {
                        _fetchProducts(selectedCategory);
                      }
                    });
                  },
                  items:
                      categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  icon: Icon(Icons.arrow_drop_down, color: Color(0xfffde1e1)),
                  iconSize: 42,
                  underline: SizedBox(),
                  style: TextStyle(
                    color: Color(0xfffde1e1),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  dropdownColor: Color(0xff925857),
                ),
              ),
            ),
            SizedBox(height: 20),
            selectedCategory == 'Rekomendasi'
                ? isLoading
                    ? Center(
                        child:
                            CircularProgressIndicator()) // menampilkan loading
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: recommendedProduct.isNotEmpty
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.55,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: recommendedProduct.length,
                                itemBuilder: (context, index) {
                                  return ProductItem(
                                    product: recommendedProduct[index],
                                    username: userId,
                                  );
                                },
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.25),
                                child: Center(
                                  child: Text(
                                    'Welcome Pengguna Baru!\nTambahkan Review Minimal 2 Produk\nTunggu Jam 00.00 WIB untuk Mendapatkan Rekomendasi!',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return ProductItem(
                          product: productList[index],
                          username: userId,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  // lebih ke UI nya makanya stateless karena yang berubah hanya isi data nya
  final Product product;
  final String username;

  const ProductItem({Key? key, required this.product, required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailProducts(product: product, user: username),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: AssetImage('lib/images/${product.image}'),
                width: 130,
                height: 150,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.name ?? 'Unknown Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              product.brand ?? 'Unknown Brand',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 4),
            Text(
              'Rp.' + product.price.toString(),
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
            Row(
              children: [
                Text(
                  '${product.rating?.toStringAsFixed(1)} ',
                ),
                Icon(Icons.star, size: 16, color: Colors.amber),
                Row(
                  children: [
                    Text(
                      '${product.positif}',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Icon(Icons.thumb_up, size: 16, color: Colors.blue),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
