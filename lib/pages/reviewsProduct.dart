class ReviewsProduct {
  String image;
  String name;
  double rating;
  String date;
  String comment;

  ReviewsProduct({
    required this.image, 
    required this.name, 
    required this.rating, 
    required this.date, 
    required this.comment});

  ReviewsProduct.fromJson(Map<String, dynamic> json)
      : image = json['image'] ?? '',
        name = json['name'] ?? '',
        rating = json['rating']?.toDouble() ?? 0.0,
        date = json['date'] ?? '',
        comment = json['comment'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['rating'] = rating;
    data['date'] = date;
    data['comment'] = comment;
    return data;
  }
}
