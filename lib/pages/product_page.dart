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
          leading: const BackButton(color: Colors.black),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Image.network(
                product!.image!,
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product!.title!,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        i < product!.rating!['rate'].round()
                            ? Icon(Icons.star_rate_rounded,
                                color: Colors.yellow.shade800)
                            : Icon(Icons.star_rate_rounded,
                                color: Colors.grey.shade400),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text('(${product!.rating!['count']} Reviews)'),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product!.price!.toDouble()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      const Text(
                        'Available in Stock',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product!.description!,
                    style: const TextStyle(
                      fontSize: 15,
                      wordSpacing: 1.5,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'Add to cart',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'fredoka medium'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
