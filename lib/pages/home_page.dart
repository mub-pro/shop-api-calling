import 'dart:collection';

import 'package:api_call/api/category_api.dart';
import 'package:api_call/api/products_api.dart';
import 'package:api_call/components/product_card.dart';
import 'package:api_call/models/product.dart';
import 'package:api_call/pages/cart_page.dart';
import 'package:api_call/pages/products_by_category.dart';
import 'package:api_call/pages/products_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoryApi _categoryApi = CategoryApi();
  final ProductsApi _productApi = ProductsApi();

  List<Map<String, dynamic>> headers = [
    {
      'color': Colors.blue,
    },
    {
      'color': Colors.deepOrangeAccent,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CartPage()));
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.black12,
                width: 300,
                height: 40,
                child: const Text(
                  'Cart Page',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu, color: Colors.black),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.black))),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 30),
            // hello
            Container(
              margin: _ml(false),
              alignment: Alignment.centerLeft,
              child:
                  Text('Hello, Mubarak', style: _style.copyWith(fontSize: 25)),
            ),
            const SizedBox(height: 20),
            // banners
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductsPage(),
                          ));
                    },
                    child: Container(
                      margin: _ml(index == 2 - 1),
                      width: 300,
                      decoration: BoxDecoration(
                        color: headers[index]['color'],
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: SizedBox(
                              width: 130,
                              child: Text('60% OFF - FINAL SALE',
                                  style: _style.copyWith(
                                      color: Colors.white, fontSize: 18)),
                            ),
                            top: 30,
                            left: 40,
                          ),
                          Positioned(
                            bottom: 20,
                            left: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              child: Text(
                                'GET NOW',
                                style: _style.copyWith(
                                    fontSize: 14, color: Colors.black54),
                              ),
                            ),
                          ),
                          Positioned(
                              right: 20,
                              top: 0,
                              bottom: 0,
                              child: Image.asset(
                                'assets/images/shopping.png',
                                width: 80,
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            // category
            Container(
              margin: _ml(false),
              alignment: Alignment.centerLeft,
              child: Text(
                'Category',
                style: _style,
              ),
            ),
            const SizedBox(height: 20),
            // categories list
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: FutureBuilder(
                  future: _categoryApi.getCategories(),
                  builder:
                      (BuildContext context, AsyncSnapshot<List?> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Center(child: Text('Nothing Happen'));
                      case ConnectionState.waiting:
                      case ConnectionState.active:
                        return const Center(child: CircularProgressIndicator());
                      case ConnectionState.done:
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            String category = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductsByCategory(
                                              category: snapshot.data![index],
                                            )));
                              },
                              child: Container(
                                margin: _ml(index == snapshot.data!.length - 1),
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Center(
                                    child: Text(
                                  category.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )),
                              ),
                            );
                          },
                        );
                    }
                  }),
            ),
            const SizedBox(height: 40),
            // latest
            Container(
              margin: _ml(false),
              alignment: Alignment.centerLeft,
              child: Text(
                'Latest',
                style: _style,
              ),
            ),
            const SizedBox(height: 20),
            // products list
            SizedBox(
              height: 6 * 130,
              child: FutureBuilder(
                future: _productApi.limitProducts(5),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Product>?> snapshot) {
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(5, (index) {
                          Product product = snapshot.data![index];
                          return ProductCard(product: product);
                        }),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get _style =>
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 22);

  EdgeInsets _ml(bool last) => EdgeInsets.only(left: 20, right: last ? 20 : 0);

  // Container _card(double width, bool m) {
  //   return Container(
  //     margin: m ? _ml : EdgeInsets.zero,
  //     width: width,
  //     decoration: BoxDecoration(
  //       color: Colors.grey,
  //       borderRadius: BorderRadius.circular(14),
  //     ),
  //   );
  // }
}

// switch (snapshot.connectionState) {
//             case ConnectionState.none:
//               return const Center(child: Text('Nothing Happen'));
//             case ConnectionState.waiting:
//             case ConnectionState.active:
//               return const Center(child: CircularProgressIndicator());
//             case ConnectionState.done:
//               return Center(
//                   child: Text('${snapshot.data!.products![1]['quantity']}'));
//           }
