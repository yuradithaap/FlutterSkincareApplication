class Skincare{
  String name;
  String category;
  String price;
  String image;
  String rating;

  Skincare({
    required this.name, 
    required this.category,
    required this.price,
    required this.image,
    required this.rating});

    String get _name => name;
    String get _category => category;
    String get _price => price;
    String get _image => image;
    String get _rating => rating;
}