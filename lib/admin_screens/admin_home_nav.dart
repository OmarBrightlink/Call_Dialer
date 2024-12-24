import 'package:flutter/material.dart';

class AdminHomeNav extends StatefulWidget {
  const AdminHomeNav({super.key});

  @override
  State<AdminHomeNav> createState() => _AdminHomeNavState();
}

class _AdminHomeNavState extends State<AdminHomeNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'CallDialer',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        actions: [],
      ),
    );
  }
}
