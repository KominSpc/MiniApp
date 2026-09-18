import 'package:flutter/material.dart';

class BottomMsgBox {
  bool _isShow = false;
  static void bottomInfo(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 1200),
        width: 300,
        content: Text(msg, textAlign: TextAlign.center),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
      ),
    );
  }
}
