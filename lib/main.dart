import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:
      Colors.orange, // Set the desired color here
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Call Dialer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(18, 66, 210, 1),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
