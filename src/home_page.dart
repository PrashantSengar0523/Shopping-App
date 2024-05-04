import 'package:flutter/material.dart';
import 'package:shopping_app/pages/cart_details.dart';
import 'package:shopping_app/pages/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentValue=0;

  List<Widget> pages= const [ProductList(), CartDetails()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentValue,
        children: pages),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentValue=value;
          });
        },
        currentIndex: currentValue,
        selectedItemColor: const Color.fromRGBO(255, 206, 1, 1),
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled,),
          label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag,),
          label: '',)
        ]),
    );
  }
}