import 'package:flutter/material.dart';

class AppGradients {
  // Define a linear gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF132E6B), Color(0xFF1242D2)], // Blue to Purple
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Define other gradients as needed
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFFFF6347), Color(0xFFFFD700)], // Tomato to Gold
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const LinearGradient dialerGradient = LinearGradient(
    colors: [Color(0xFF007991), Color(0xFF78ffd6)], // Tomato to Gold
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
