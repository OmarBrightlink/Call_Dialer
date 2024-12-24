import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShowLoader {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'raw/universal_loader.json',
                width: 200,
                height: 200,
                //fit: BoxFit.fill,
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}