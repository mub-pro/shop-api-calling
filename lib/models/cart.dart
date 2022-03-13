class Cart {
  int? id;
  int? userId;
  String? date;
  List<Map<String, dynamic>>? products;

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];
    products = <Map<String, dynamic>>[];
    json['products'].forEach((p) {
      Map<String, dynamic> product = {
        'productId': p['productId'],
        'quantity': p['quantity'],
      };
      products!.add(product);
    });
  }
}
