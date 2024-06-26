import 'dart:convert';
import 'package:rekomendasi/pages/productModal.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String baseUrl = 'http://10.0.2.2:5000/';

  Future<List<Product>> fetchProduct(String category) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products/$category'));
      final body = response.body;
      final result = jsonDecode(body);
      
      List<Product> products = List<Product>.from(
        result['data'].map(
          (product) => Product.fromJson(product),
        ),
      );

      return products;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Product>> fetchPredict(String user_id) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/predict/$user_id'));
    final body = response.body;
    final List<dynamic> result = jsonDecode(body)['data'];

    List<Product> predicts = result.map((predict) => Product.fromJson(predict)).toList();

    return predicts;
  } catch (e) {
    throw Exception(e.toString());
  }
}

  Future<bool> deleteProduct(int productId) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/delete_product/$productId'));
      return response.statusCode == 200;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
