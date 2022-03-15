import 'package:api_call/models/product.dart';
import 'package:api_call/pages/product_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, this.product}) : super(key: key);
  final Product? product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPage(product: widget.product)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 40,
              child: Image.network(
                widget.product!.image!,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                )),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(6)),
                width: 120,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product!.title!.substring(0, 10),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\$${widget.product!.price!.toDouble()}',
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'fredoka medium'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
