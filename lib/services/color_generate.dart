
import 'package:flutter/material.dart';
import 'dart:math';


///Generate Unique Color
Color getUniqueColor() {
  final Random random = Random();

  // Generate random color components
  final int red = random.nextInt(256);
  final int green = random.nextInt(256);
  final int blue = random.nextInt(256);

  return Color.fromARGB(255, red, green, blue);
}