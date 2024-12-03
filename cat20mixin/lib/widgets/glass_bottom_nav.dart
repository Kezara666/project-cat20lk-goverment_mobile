
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassmorphicBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  GlassmorphicBottomBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // Glass blur effect
        child: Container(
          height: screenHeight / 8.5,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1), // Transparent color
            border: Border.all(
              color: Colors.white.withOpacity(0.2), // Border to mimic glass
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent, // Transparent background
            elevation: 0,
            currentIndex: currentIndex,
            onTap: onTap,
            selectedItemColor: Colors.blue, // Selected item color
            unselectedItemColor: Colors.grey.shade400, // Unselected item color
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Order List',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add Order',
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
