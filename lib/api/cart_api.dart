import 'dart:convert';

import 'package:api_call/models/cart.dart';
import 'package:http/http.dart' as http;

class CartApi {
  final String _url = 'https://fakestoreapi.com/carts';

  Future<List<Cart>?> getCartsByUser(int userId) async {
    http.Response response =
        await http.get(Uri.parse(_url + '/user/' + userId.toString()));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Cart> carts = body.map((e) => Cart.fromJson(e)).toList();
      return carts;
    }
  }

  Future<Cart?> getCartById(int id) async {
    http.Response response =
        await http.get(Uri.parse(_url + '/' + id.toString()));

    if (response.statusCode == 200) {
      return Cart.fromJson(jsonDecode(response.body));
    }
  }
}
