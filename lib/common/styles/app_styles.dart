//button style dung chung cho elevated style
import 'package:flutter/material.dart';

final baseElevatedButtonStyle = ButtonStyle(
  shape: WidgetStatePropertyAll(
    const RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
    ),
  ),
  elevation: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.pressed)) {
      return 2;
    }
    return 4;
  }),
);

//style boder dung chung
final boderTextField = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: BorderSide(color: Colors.transparent),
);
