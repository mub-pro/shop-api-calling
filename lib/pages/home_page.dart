import 'package:api_call/pages/products_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> headers = [
    {
      'color': Colors.deepOrangeAccent,
    },
    {
      'color': Colors.blue,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu, color: Colors.black),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.black))),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: _ml(false),
              alignment: Alignment.centerLeft,
              child: Text('Hello, name', style: _style),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
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
                              padding: EdgeInsets.symmetric(
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
            SizedBox(height: 40),
            Container(
              margin: _ml(false),
              alignment: Alignment.centerLeft,
              child: Text(
                'Category',
                style: _style,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: _ml(index == 6 - 1),
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                          child: Text(
                        'Electronic',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 40),
            Container(
              margin: _ml(false),
              alignment: Alignment.centerLeft,
              child: Text(
                'Latest',
                style: _style,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 6 * 130,
              child: GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 130.0 / 170.0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                    6,
                    (index) => GestureDetector(
                          onTap: () {},
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
                                    child: Image.asset(
                                      'assets/images/watch.png',
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.circular(6)),
                                    width: 120,
                                    height: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Apple Watch'),
                                          Text('\$140.0'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get _style =>
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

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
