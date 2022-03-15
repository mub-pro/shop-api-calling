import 'package:api_call/api/products_api.dart';
import 'package:api_call/models/product.dart';
import 'package:flutter/material.dart';

import 'product_page.dart';

class ProductsByCategory extends StatelessWidget {
  ProductsByCategory({Key? key, this.category}) : super(key: key);
  final String? category;

  final ProductsApi _productsApi = ProductsApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(color: Colors.black),
      ),
      body: FutureBuilder(
          future: _productsApi.getProductsByCategory(category!),
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductPage(product: product)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                left: 0,
                                right: 0,
                                top: 30,
                                child: Image.network(
                                  product.image!,
                                  height: 120,
                                )),
                            Positioned(
                                right: 0,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite),
                                )),
                            Positioned(
                              bottom: 10,
                              right: 0,
                              left: 0,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(6)),
                                width: 120,
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.title!.substring(0, 10)),
                                      Text('\$${product.price!}'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
            }
          }),
    );
  }
}
