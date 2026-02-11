// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RowColumnWrap extends StatelessWidget {
  const RowColumnWrap({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width; //chieu rong toan man hinh
    //chieu cao toan man hinh tinh tu bottom cua appbar
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Row Column',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: w,
        height: h,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(width: 30, height: 30, color: Colors.blue),
            Container(width: 30, height: 30, color: Colors.amberAccent),
            Container(width: 30, height: 30, color: Colors.cyanAccent),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 30, height: 30, color: Colors.blue),
                Container(width: 30, height: 30, color: Colors.amberAccent),
                Container(width: 30, height: 30, color: Colors.cyanAccent),
                Container(width: 30, height: 30, color: Colors.green),
                Container(width: 30, height: 30, color: Colors.pink),
              ],
            ),
            Container(width: 30, height: 30, color: Colors.green),
            Container(width: 30, height: 30, color: Colors.pink),
          ],
        ),
      ),
    );
  }
}
