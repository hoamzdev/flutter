import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final String tag;

  const Product({
    super.key,
    required this.tag,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: tag,
          child: Center(child: Image.asset(image, width: 300)),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: 40, right: 20),
          child: Text(
            'More detaila bout product, that customor wants to know',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 55, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$$price",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              Image.asset(
                'assets/images/basket icon.png',
                height: 60,
                width: 60,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
