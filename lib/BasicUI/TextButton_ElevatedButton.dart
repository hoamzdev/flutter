// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ui_flutter/common/Logger.dart';

class TextbuttonElevatedbutton extends StatelessWidget {
  const TextbuttonElevatedbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TextButton ElevatedButton',
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Logger.logTest(tag: "TEST", msg: "Clicked By hoamz");
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Colors.pinkAccent,
                ), //mau nen cua nut
                //foreground la mau cua noi dung ben trong nut
                elevation: WidgetStateProperty.all(5),
                //kich co button
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                //bo goc
                shape: WidgetStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                  ),
                ),
              ),
              child: Text(
                'Click me',
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 10, height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.deepPurpleAccent,
                  ),
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                //nhan nut sẽ hiện thị snackbar
                onPressed: () {
                  Logger.logTest(
                    tag: "TestSnackbar",
                    msg: "DINH VAN HOA CLICKED",
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    appSnackbar(
                      text: 'Remove item',
                      visible: () {
                        Logger.logError(
                          tag: "Visible",
                          msg: 'Snackbar visible',
                        );
                      },
                      snackbarAction: SnackBarAction(
                        textColor: Colors.white,
                        label: 'Undo',
                        onPressed: () {
                          Logger.logError(tag: 'Undo', msg: 'Restore item');
                        },
                      ),
                    ),
                  );
                },
                child: Text(
                  'Click me',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),

            GestureDetector(
              onTap: () {
                Logger.logTest(tag: 'HOA', msg: 'dinh van hoa');
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.only(left: 16, right: 16),
                color: Colors.deepOrange,
                child: Center(
                  child: Text(
                    'Click Me',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SnackBar appSnackbar({
  required String text, //noi dung snackbar
  Function? visible, //func khi snackbar show
  required SnackBarAction snackbarAction,
}) {
  return SnackBar(
    content: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: Colors.white,
      ),
    ), //noi dung chinh cua snackbar
    backgroundColor: Colors.pinkAccent, //mau nen cua snackbar
    behavior: SnackBarBehavior.floating, //cach snackbar hien thi
    margin: const EdgeInsets.all(16), //margin
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(12), //bo goc cho snackbar
    ),
    duration: const Duration(seconds: 2), //thoi gian hien thi
    // showCloseIcon: true,//true : hien thi dau x de click vao thi an snackbar
    //khi snackbar visible thi no chay ham nay
    onVisible: visible?.call(),
    //vuot sang ngang de xoa snackbar(default la vuot xuong bottom la huy)
    dismissDirection: DismissDirection.horizontal,
    //hanh dong
    action: snackbarAction,
  );
}
