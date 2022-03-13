import 'dart:convert';

import 'package:api_call/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsApi {
  final String _url = 'https://fakestoreapi.com/products';

  Future<List<Product>?> getProducts() async {
    http.Response response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> products = body.map((e) => Product.fromJson(e)).toList();
      return products;
    }
  }

  Future<Product?> getProductById(int id) async {
    http.Response response =
        await http.get(Uri.parse(_url + '/' + id.toString()));

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    }
  }

  Future<List<Product>?> getProductsByCategory(String category) async {
    http.Response response =
        await http.get(Uri.parse(_url + '/' + 'category' + '/' + category));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> products = body.map((e) => Product.fromJson(e)).toList();
      return products;
    }
  }
}
