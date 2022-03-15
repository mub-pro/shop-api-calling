import 'package:api_call/api/cart_api.dart';
import 'package:api_call/api/products_api.dart';
import 'package:api_call/models/cart.dart';
import 'package:api_call/models/product.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartApi _cartApi = CartApi();

  final ProductsApi _productsApi = ProductsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'My Cart',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true),
      body: FutureBuilder(
        future: _cartApi.getCartById(1),
        builder: (BuildContext context, AsyncSnapshot<Cart?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(child: Text('Nothing Happen'));
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: ListView.builder(
                        itemCount: snapshot.data!.products!.length,
                        itemBuilder: (context, index) {
                          Cart cart = snapshot.data!;
                          return FutureBuilder(
                              future: _productsApi.getProductById(
                                  cart.products![index]['productId']),
                              builder: (BuildContext context,
                                  AsyncSnapshot<Product?> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                    return const Center(
                                        child: Text('Nothing Happen'));
                                  case ConnectionState.waiting:
                                  case ConnectionState.active:
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  case ConnectionState.done:
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .12,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 16),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Stack(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(children: [
                                                //Image
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 14.0),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .23,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                      // color: Colors.black12,
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              snapshot.data!
                                                                  .image!))),
                                                ),
                                                //Text
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 12.0),
                                                          child: Text(snapshot
                                                              .data!.title!
                                                              .substring(
                                                                  0, 10)),
                                                        ),
                                                        const Text(
                                                          'description',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      '\$${snapshot.data!.price!}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                              // Counter
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  // height: 20,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 6,
                                                      horizontal: 12),
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          // print('decrease');
                                                          // cartProvider.decreaseCounter(
                                                          //     cartProvider.allCarts[index]);
                                                        },
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 8.0),
                                                          child: Icon(
                                                            Icons.remove,
                                                            size: 16,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                          '${cart.products![index]['quantity']}'),
                                                      GestureDetector(
                                                        onTap: () {
                                                          // print('increase');
                                                          // cartProvider.increaseCounter(
                                                          //     cartProvider.allCarts[index]);
                                                        },
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 8.0),
                                                          child: Icon(
                                                            Icons.add,
                                                            size: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                }
                              });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.white,
                      child: LayoutBuilder(
                        builder: (context, local) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Button
                              FlatButton(
                                height: local.maxHeight * .3,
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () {},
                                child: const Text(
                                  'PAY',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                color: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              );
          }
        },
      ),
    );
  }
}
