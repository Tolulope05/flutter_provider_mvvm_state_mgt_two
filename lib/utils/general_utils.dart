import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.greenAccent,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static void flushErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: Colors.black87,
        icon: const Icon(
          Icons.message,
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(5),
        duration: const Duration(seconds: 3),
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(5),
          duration: const Duration(seconds: 3),
        ),
      );
}
