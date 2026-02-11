import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:ui_flutter/Day_2_learn_UI/login_screen.dart';
import 'package:ui_flutter/Day_3_learn_UI/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //khoi tao cac widget
  //khoa huong man hinh
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    value,
  ) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //an banner default
      theme: ThemeData(textTheme: GoogleFonts.playfairDisplayTextTheme()),
      home: HomePage(),
    );
  }
}
