// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_flutter/Day_1_Learn_UI/Utils/colors.dart';

class ProductUI {
  final String name;
  final String image;
  final String price;

  ProductUI({required this.name, required this.image, required this.price});
}

class ProductDetail extends StatelessWidget {
  final String tag;

  final Map<String, ProductUI> mapData = {
    '1': ProductUI(
      name: 'House Shape \n ClosePlant',
      image: 'assets/images/flower1.png',
      price: r"$45",
    ),
    '2': ProductUI(
      name: 'Glass Water',
      image: 'assets/images/flower2.png',
      price: r"$90",
    ),
  };

  ProductDetail({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              bottomParts(context),
              Positioned(
                top: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(
                          top: MediaQuery.of(context).padding.top,
                          right: 16,
                          left: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context); //back ve home
                              },
                              splashColor: Colors.white.withValues(
                                alpha: 0.3,
                              ), //mau ripple
                              splashRadius: 30, //kich co ripple
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.pink,
                              ),
                            ),
                            Image.asset(
                              'assets/images/filter icon.png',
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      //name
                      Padding(
                        padding: const EdgeInsetsGeometry.only(
                          left: 32,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              mapData[tag]?.name ?? 'error',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                //add to favorite
                              },
                              icon: Icon(
                                Icons.favorite_outline_outlined,
                                color: Colors.pink,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 50),

                      //image
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Stack(
                          children: [
                            Image.asset(
                              mapData[tag]?.image ?? 'error',
                              width: MediaQuery.of(context).size.width,
                            ),

                            //scroll dot
                            itemDot(paddingTop: 220, color: primaryColor),
                            itemDot(
                              paddingTop: 245,
                              color: Colors.pink.withValues(alpha: 0.2),
                              height: 8,
                              circular: 40,
                            ),
                            itemDot(
                              paddingTop: 260,
                              color: Colors.pink.withValues(alpha: 0.2),
                              height: 8,
                              circular: 40,
                            ),
                            itemDot(
                              paddingTop: 275,
                              color: Colors.pink.withValues(alpha: 0.2),
                              height: 8,
                              circular: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //price
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                left: 32,
                child: Text(
                  mapData[tag]?.price ?? 'error',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),

              //add to card
              Positioned(
                top: MediaQuery.of(context).size.height * 0.5,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                    ),
                    color: primaryColor,
                  ),
                  height: 70,
                  width: 70,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle,
                      color: secondaryColor,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding itemDot({
    required double paddingTop,
    double height = 20,
    required Color color,
    double circular = 20,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Container(
        height: height,
        width: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circular),
          color: color,
        ),
      ),
    );
  }

  Positioned bottomParts(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: primaryColor,
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            top: MediaQuery.of(context).size.height * 0.85,
            left: 24,
            right: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomPartItem(label: 'Height', value: '40cm - 50cm'),
              bottomPartItem(label: 'Pot', value: 'Self Watering Pot'),
              bottomPartItem(label: 'Temperatre', value: '18C - 25C'),
            ],
          ),
        ),
      ),
    );
  }

  Column bottomPartItem({required String label, required String value}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Text(value, style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}
