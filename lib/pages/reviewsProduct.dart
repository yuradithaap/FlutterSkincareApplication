class ReviewsProduct {
  final int? id;
  final String? name;
  final String? user;
  final double? rate;
  final String? date;
  final String? image;
  final String? reviews;

  ReviewsProduct({
    required this.id,
    required this.name,
    required this.user,
    required this.rate,
    required this.date,
    required this.image,
    required this.reviews,
  });

  factory ReviewsProduct.fromJson(Map<String, dynamic> json) {
    return ReviewsProduct(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown Name',
      user: json['user'] ?? 'Unknown User',
      rate: json['rate'].toDouble() ?? 0.0,
      date: json['date'] ?? 'Unknown Date',
      image: json['image'] ?? 'Unknown Image',
      reviews: json['reviews'] ?? 'Unknown Reviews',
    );
  }
}
