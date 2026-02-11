//button have icon
import 'package:flutter/material.dart';
import 'package:ui_flutter/common/styles/app_styles.dart';

Expanded btnHaveIcon({
  required String imageLink,
  required String textButton,
  required Function onClick,
}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(left: 16, right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.8),
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          //action when click
          onClick();
        },
        style: baseElevatedButtonStyle.copyWith(
          padding: WidgetStatePropertyAll(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          ),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        child: Row(
          children: [
            Image.asset(imageLink, width: 25, height: 25),
            SizedBox(width: 10),
            Text(
              textButton,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    ),
  );
}
