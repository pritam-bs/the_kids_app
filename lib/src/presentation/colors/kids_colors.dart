import 'package:flutter/material.dart';
import 'dart:math';

class KidsColors {
  // A list of kid-friendly colors for various UI elements
  static final List<Color> kidFriendlyColors = [
    Colors.lightBlue.shade400,
    Colors.lightGreen.shade500,
    Colors.orange.shade300,
    Colors.purple.shade300,
    Colors.pink.shade300,
    Colors.teal.shade300,
    Colors.amber.shade300,
    Colors.cyan.shade300,
    Colors.red.shade300,
    Colors.indigo.shade300,
    Colors.lime.shade500,
    Colors.deepOrange.shade300,
    Colors.blueGrey.shade400,
  ];

  // Static method to get a random color from the list
  static Color getRandomKidFriendlyColor() {
    final Random random = Random();
    return kidFriendlyColors[random.nextInt(kidFriendlyColors.length)];
  }

  // Helper to determine a contrasting text/icon color for a given background color
  static Color getOnColor(Color backgroundColor) {
    // Calculate luminance to decide between black or white text
    return ThemeData.estimateBrightnessForColor(backgroundColor) ==
            Brightness.dark
        ? Colors
              .white // Use white text for dark backgrounds
        : Colors.black; // Use black text for light backgrounds
  }
}
