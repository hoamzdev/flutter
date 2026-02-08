import 'package:flutter/material.dart';
import 'package:ui_flutter/TextFieldLearn.dart';
// import 'package:ui_flutter/BottomNavigationLearn.dart';
// import 'package:ui_flutter/PullToRefresh.dart';
// import 'package:ui_flutter/dropdown.dart';
// import 'package:ui_flutter/BottomSheetLearn.dart';
// import 'package:ui_flutter/AlertDialogLearn.dart';
// import 'package:ui_flutter/drawer_layout.dart';
// import 'package:ui_flutter/image_view.dart';
// import 'package:ui_flutter/Dismissible_my.dart';
// import 'package:ui_flutter/ListView_GridView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //an banner default
      theme: ThemeData(brightness: Brightness.light),
      home: TextFieldLearn(),
    );
  }
}
