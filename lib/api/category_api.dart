import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryApi {
  final String _url = 'https://fakestoreapi.com/products/categories';

  Future<List?> getCategories() async {
    http.Response response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      List categories = jsonDecode(response.body);
      return categories;
    }
  }
}
