import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'My Cart',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .12,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              //Image
                              Container(
                                margin: EdgeInsets.only(right: 14.0),
                                width: MediaQuery.of(context).size.width * .23,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    // color: Colors.black12,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/watch.png'))),
                              ),
                              //Text
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12.0),
                                        child: Text('Apple Watch'),
                                      ),
                                      Text(
                                        'description',
                                        style: TextStyle(color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${300} \$',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ]),
                            // Counter
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                // height: 20,
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 12),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // print('decrease');
                                        // cartProvider.decreaseCounter(
                                        //     cartProvider.allCarts[index]);
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Icon(
                                          Icons.remove,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    Text('${2}'),
                                    GestureDetector(
                                      onTap: () {
                                        // print('increase');
                                        // cartProvider.increaseCounter(
                                        //     cartProvider.allCarts[index]);
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
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
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: LayoutBuilder(
                builder: (context, local) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Details
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Items'),
                              Text('${10}'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total'),
                                Text('\$${20} '),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //Button
                      FlatButton(
                        height: local.maxHeight * .3,
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {},
                        child: Text(
                          'PAY',
                          style: TextStyle(color: Colors.white, fontSize: 16),
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
      ),
    );
  }
}
