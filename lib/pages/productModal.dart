class Product{
  int? id;
  String? category;
  String? brand;
  String? name;
  String? image;
  int? price;
  double? rating;
  String? positif;
  String? desc;

  Product({
    required this.id,
    required this.category,
    required this.brand,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.positif,
    required this.desc
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'] ?? 0,
      category: json['category'] ?? '',
      brand: json['brand'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? 0,
      rating: json['rating'] ?? 0.0,
      positif: json['positif'] ?? '',
      desc: json['desc'] ?? ''
    );
  }
}