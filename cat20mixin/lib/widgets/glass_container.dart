import 'dart:ui';
import 'package:flutter/material.dart';

// Corrected glassmorphismContainer function that returns a Widget
Widget glassmorphismContainer(
    String text, BuildContext context, List<Color> colors) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  int colorIndex = 0;
  return ClipRRect(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(screenWidth / 2)),
        //topLeft: Radius.circular(screenWidth / 2)), // Rounded corners
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Apply blur effect
      child: AnimatedContainer(
        width: screenWidth * 0.9,
        height: screenHeight * 0.1,
        duration: Duration(seconds: 2), // Duration of each color change
        curve: Curves.easeInOut, // Easing function for smooth transition
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft, // Starting point of the gradient
          end: Alignment.bottomRight, // Ending point of the gradient
        )),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
