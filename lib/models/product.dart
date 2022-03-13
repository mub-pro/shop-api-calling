class Product {
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;
  Map<String, dynamic>? rating;

  // Product({this.id, this.title, this.description, this.image, this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    category = json['category'];
    image = json['image'];
    Map<String, dynamic> rating = {
      'rate': json['rating']['rate'],
      'count': json['rating']['count'],
    };
    this.rating = rating;
  }
}
