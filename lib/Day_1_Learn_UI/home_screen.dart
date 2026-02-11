import 'package:flutter/material.dart';
// import 'package:ui_flutter/Day_1_Learn_UI/Screen/detailscreen.dart';
import 'package:ui_flutter/Day_1_Learn_UI/product.dart';
import 'package:ui_flutter/Day_1_Learn_UI/product_detail.dart';
import 'package:ui_flutter/common/constants/app_colors.dart';
// import 'package:ui_flutter/common/Logger.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Row(children: [sideBar(context), bodyParts(size, context)]),
            Positioned(
              top: size.height * 0.2,
              left: 29,
              child: Text(
                'Plants',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            Positioned(
              top: size.height * 0.055,
              right: 10,
              child: Icon(Icons.search, color: Colors.black, size: 35),
            ),
          ],
        ),
      ),
    );
  }

  Container bodyParts(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.8,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.12),
            GestureDetector(
              onTap: () {
                // Logger.logTest(tag: 'TEST', msg: 'clicked flower1');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductDetail(
                        tag: '1',
                        // name: 'House Shape \n ClosePlant',
                        // image: 'assets/images/flower1.png',
                        // price: r"$45",
                      );
                    },
                  ),
                );
              },
              child: Product(
                tag: '1',
                name: 'House Shape Close',
                price: '45',
                image: 'assets/images/flower1.png',
              ),
            ),
            GestureDetector(
              onTap: () {
                // Logger.logTest(tag: 'TEST', msg: 'clicked flower2');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductDetail(
                        tag: '2',
                        // name: 'Glass Water',
                        // image: 'assets/images/flower2.png',
                        // price: r"$90",
                      );
                    },
                  ),
                );
              },
              child: Product(
                tag: '2',
                name: 'Glass Water',
                price: '90',
                image: 'assets/images/flower2.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  //sideBar
  Expanded sideBar(BuildContext context) {
    return Expanded(
      child: Container(
        color: secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 35),
              child: Image.asset('assets/images/more icon.png', width: 60),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Green', style: TextStyle(fontSize: 15)),
            ),

            const SizedBox(height: 180),

            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: RotatedBox(
                quarterTurns: 3,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '.',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Shape Class',
                        style: TextStyle(color: primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'Indore Plants',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsetsGeometry.only(right: 16, top: 100),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: primaryColor,
                ),
                width: 70,
                height: 70,
                child: const Icon(Icons.home, color: Colors.white, size: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
