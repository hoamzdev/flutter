// ignore: file_names
import 'package:flutter/material.dart';

class Logger {
  static void logError({required String tag, required String msg}) {
    debugPrint('\x1B[31m[$tag] $msg\x1B[0m');
  }

  static void logTest({required String tag, required String msg}) {
    debugPrint('\x1B[32m[$tag] $msg\x1B[0m');
  }
}
