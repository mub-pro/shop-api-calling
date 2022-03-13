import 'package:api_call/api/cart_api.dart';
import 'package:api_call/api/products_api.dart';
import 'package:api_call/models/cart.dart';
import 'package:api_call/models/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CartApi api = CartApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: api.getCartById(3),
        builder: (BuildContext context, AsyncSnapshot<Cart?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(child: Text('Nothing Happen'));
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return Center(
                  child: Text('${snapshot.data!.products![1]['quantity']}'));
          }
        },
      ),
    );
  }
}
