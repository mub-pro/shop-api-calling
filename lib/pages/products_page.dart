import 'package:api_call/api/products_api.dart';
import 'package:api_call/components/product_card.dart';
import 'package:api_call/models/product.dart';
import 'package:flutter/material.dart';

import 'product_page.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);

  final ProductsApi _productsApi = ProductsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('PRODUCTS', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(color: Colors.black),
      ),
      body: FutureBuilder(
          future: _productsApi.getProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Text('Nothing Happen'));
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                return GridView.count(
                  shrinkWrap: true,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 130.0 / 170.0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(snapshot.data!.length, (index) {
                    Product product = snapshot.data![index];
                    return ProductCard(product: product);
                  }),
                );
            }
          }),
    );
  }
}
