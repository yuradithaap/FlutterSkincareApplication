import 'dart:convert';
import 'package:rekomendasi/pages/reviewsProduct.dart';
import 'package:http/http.dart' as http;

class ReviewService {
  static const String baseUrl = 'http://10.0.2.2:5000/';

  Future<List<ReviewsProduct>> fetchReviews(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/reviews/$id'),
        headers: {
          "Connection": "Keep-Alive",
          'Accept-Encoding': 'gzip, deflate, br'
        },
      );
      final body = response.body;
      final result = jsonDecode(body);
      
      List<ReviewsProduct> reviews = List<ReviewsProduct>.from(
        result['data'].map(
          (review) => ReviewsProduct.fromJson(review),
        ),
      );

      return reviews;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ReviewsProduct>> fetchHistory(String user) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/reviews_user/$user'),
        headers: {
          "Connection": "Keep-Alive",
          'Accept-Encoding': 'gzip, deflate, br'
        },
      );
      final body = response.body;
      final result = jsonDecode(body);
      
      List<ReviewsProduct> history = List<ReviewsProduct>.from(
        result['data'].map(
          (history) => ReviewsProduct.fromJson(history),
        ),
      );

      return history;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
