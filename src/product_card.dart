import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget{
  final String title;
  final double price;
  final String image;
  const ProductCard(
    {required this.title,
      
      required this.price,
      required this.image,
      super.key
    });

  @override
  Widget build(BuildContext context){
    return  Column(
      children: [
        Container(
          margin:const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(255,255, 255, 1),
          ),
          
          
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style:
               const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromRGBO(0, 0, 0, 10),
              )
              ),
              Text('\$$price',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color.fromRGBO(0, 0, 0, 10),),),
              Image.asset(image, height: 200,width: 400,),
            ],
          )
        )
      ],
    );
  }
}

