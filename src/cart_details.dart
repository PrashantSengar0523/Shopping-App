import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cart_provider.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({super.key});

  @override
  Widget build(BuildContext context) {
  final cart=Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context,index){
          final cartItem=cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
              // backgroundColor: Colors.amber[50],
              radius: 25,
            ),
            trailing: IconButton(onPressed: () {
              showDialog(
                context: context,
                builder: (context){
                  return  AlertDialog(
                    title: const Text('Delete Product', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                    content: const Text('Are you sure want to delete item'),
                    actions: [
                      TextButton(
                        onPressed:() {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No')),
                      
                      TextButton(
                        onPressed:() {
                          Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Yes')),      
                    ],
                  );
                });
            }, icon:const Icon(Icons.delete_rounded)),
            title: Text(cartItem['title'].toString(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            subtitle: Text('Size:${cartItem['sizes']}', style: const TextStyle(
              fontSize: 16,

            ),),
          );
      })
    );
  }
}