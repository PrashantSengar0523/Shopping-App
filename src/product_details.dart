import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cart_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedSize=0;
  void onTap(){
    if(selectedSize!=0){
    Provider.of<CartProvider>(context, listen: false).addProduct(
  {
    'id' : widget.product['id'],
    'title':widget.product['title'],
    'price':widget.product['price'],
    'imageUrl':widget.product['imageUrl'],
    'company':widget.product['company'],
    'sizes':selectedSize,
  });
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added Successfully'),));
  } else{
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Select Size'),));
  }
  }
  @override
  Widget build(BuildContext context) {
    var primaryColor = const Color.fromRGBO(255, 206, 1, 1);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.headlineMedium,
          )),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              // color: Color.fromRGBO(1, 1, 1, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              widget.product['imageUrl'] as String,
              
            ),
          ),
          const Spacer(flex: 4),
          Container(
            height: 240,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(50)),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    '\$${widget.product['price']}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size = (widget.product['sizes'] as List<int>)[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize=size;
                              });
                            },
                            child: Chip(
                              backgroundColor: selectedSize==size?primaryColor:Colors.white,
                                label: Text(
                              size.toString(),
                            ),
                            
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed:onTap,
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      fixedSize: const Size(300, 50)
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
