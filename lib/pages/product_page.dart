import 'package:api_call/api/products_api.dart';
import 'package:api_call/models/product.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, this.product}) : super(key: key);
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: BackButton(color: Colors.black),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Image.network(
              product!.image!,
              height: MediaQuery.of(context).size.height / 2,
              width: 300,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product!.title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        i <= 2
                            ? Icon(Icons.star_rate_rounded,
                                color: Colors.yellow.shade700)
                            : Icon(Icons.star_rate_rounded,
                                color: Colors.grey.shade400),
                      Padding(
                        padding: EdgeInsets.only(left: 50.0),
                        child: Text('${product!.rating!['count']}'),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product!.price!}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text('Available in Stock')
                    ],
                  ),
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(product!.description!),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        'ADD TO CART',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            // SizedBox(height: 20),
          ],
        )
            // FutureBuilder(
            //   future: _productsApi.getProductById(productId!),
            //   builder:
            //       (BuildContext context, AsyncSnapshot<Product?> snapshot) {
            //     switch (snapshot.connectionState) {
            //       case ConnectionState.none:
            //         return const Center(child: Text('Nothing Happen'));
            //       case ConnectionState.waiting:
            //       case ConnectionState.active:
            //         return const Center(child: CircularProgressIndicator());
            //       case ConnectionState.done:
            //         return ;
            //     }
            //   }),
            ),
      ),
    );
  }
}
