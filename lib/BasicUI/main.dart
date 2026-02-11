import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_flutter/Day_2_learn_UI/login_screen.dart';

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
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
      home: LoginPage(),
    );
  }
}
