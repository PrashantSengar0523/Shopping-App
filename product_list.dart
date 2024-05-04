import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:shopping_app/pages/global_variables.dart';
import 'package:shopping_app/pages/product_card.dart';
import 'package:shopping_app/pages/product_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final border = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(225, 225, 225, 1),
    ),
    borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50), right: Radius.circular(50)),
  );

  final List<String> filters = [
    'All',
    'Addidas',
    'Nike',
    'Jordan',
    'Canvas',
    'Puma'
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Shoes Collection',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search_rounded),
                  prefixIconColor: const Color.fromRGBO(119, 119, 119, 1),
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Container(
                        margin: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // print('object');
                              selectedFilter = filter;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedFilter == filter
                                ? const Color.fromRGBO(255, 206, 1, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                            side: const BorderSide(
                                color: Color.fromRGBO(245, 247, 249, 1)),
                            label: Text(filter,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(0, 0, 0, 10),
                                )),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ));
                  }),
            ),
Expanded(
  child: GridView.builder(
    itemCount: products.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
      crossAxisSpacing: MediaQuery.of(context).size.width > 600 ? 10 : 0, // Adjust the spacing based on screen width
      mainAxisSpacing: MediaQuery.of(context).size.width > 600 ? 10 : 0, // Adjust main axis spacing based on screen width if needed
    ),
    itemBuilder: (context, index) {
      final product = products[index];
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ProductDetails(product: product);
          }));
        },
        child: ProductCard(
          title: product['title'] as String,
          price: product['price'] as double,
          image: product['imageUrl'] as String,
        ),
      );
    },
  ),
),

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: products.length,
            //     itemBuilder: (context, index) {
            //       final product = products[index];
            //       return GestureDetector(
            //         onTap: () {
            //           Navigator.of(context)
            //               .push(MaterialPageRoute(builder: (context) {
            //             return ProductDetails(product: product);
            //           }));
            //         },
            //         child: ProductCard(
            //           title: product['title'] as String,
            //           price: product['price'] as double,
            //           image: product['imageUrl'] as String,
            //         ),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
