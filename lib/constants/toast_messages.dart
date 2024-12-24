import 'package:flutter/material.dart';

class Toasty {
  final BuildContext context;

  Toasty(this.context);

  void _showSnackBar(String message, {Color backgroundColor = Colors.black}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(30),
      ),
    );
  }

  void showError(String message) {
    _showSnackBar(
      message,
      backgroundColor: Colors.red,
    );
  }

  void showWarning(String message) {
    _showSnackBar(
      message,
      backgroundColor: Colors.orange,
    );
  }

  void showInfo(String message) {
    _showSnackBar(
      message,
      backgroundColor: Colors.blue,
    );
  }

  void showSuccess(String message) {
    _showSnackBar(
      message,
      backgroundColor: Colors.green,
    );
  }
}
