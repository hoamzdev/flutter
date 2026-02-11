// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ui_flutter/common/Logger.dart';

class AlertDialogLearn extends StatefulWidget {
  const AlertDialogLearn({super.key});

  @override
  State<AlertDialogLearn> createState() => _AlertDialogLearnState();
}

class _AlertDialogLearnState extends State<AlertDialogLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'AlertDialog',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.zero,
                  child: Center(child: Text('Hello world')),
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: ElevatedButton(
                  onPressed: () async {
                    bool? result = await _showMyDialog(
                      context,
                    ); //doi cho den khi dialog dong va nhan ket qua tra ve
                    //xu ly ket qua
                    if (result == true) {
                      Logger.logTest(tag: 'OK', msg: 'User clicked Yes');
                    } else {
                      Logger.logError(tag: 'Not ok', msg: 'User clicked No');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.pinkAccent),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    elevation: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.pressed)) return 2;
                      return 6;
                    }),
                  ),
                  child: Text(
                    'Show dialog',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  //AlertDialog voi kic co va lay ou size mac dinh (dung tien choi nhung dialog ko can thiet ke ca nhan hoa)

  Future<bool?> _showMyDialog(BuildContext context) async {
    //context cua man hinh
    return showDialog<bool?>(
      context: context,
      // barrierDismissible: false,//false(nhan ra ngoai ko an dialog) : (max dinh la true)
      // barrierColor: Colors.amber,//mau nen khi dialog hien thi
      builder: (BuildContext contextOfDialog) {
        //context cua rieng dialog
        return AlertDialog(
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text("Are you sure"),
          content: Text('Delete database'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(contextOfDialog, false);
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(contextOfDialog, true);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  //cuatom dialog ca nhan
  // Future<bool?> _showMyDialog(BuildContext context) async {
  //   //context cua man hinh ngoai
  //   return showDialog<bool?>(
  //     context: context,
  //     builder: (contextOfDialog) {
  //       //context cua rieng dialog
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         child: Container(
  //           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             mainAxisSize: MainAxisSize.min, //dialog om vua noi dung
  //             children: [
  //               Text(
  //                 'Are you sure',
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.normal,
  //                   color: Colors.black,
  //                 ),
  //               ),

  //               SizedBox(height: 20),

  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [
  //                   TextButton(
  //                     onPressed: () {
  //                       Navigator.pop(context, true);
  //                     },
  //                     child: Text('Yes'),
  //                   ),
  //                   TextButton(
  //                     onPressed: () {
  //                       Navigator.pop(context, false);
  //                     },
  //                     child: Text('No'),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 20),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
