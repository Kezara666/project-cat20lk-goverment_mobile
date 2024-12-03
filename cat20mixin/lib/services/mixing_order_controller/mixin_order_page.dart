
import 'package:cat20mixing/pages/mix_income/add_order_page.dart';
import 'package:cat20mixing/pages/mix_income/list_order.dart';
import 'package:cat20mixing/widgets/glass_bottom_nav.dart';
import 'package:flutter/material.dart';

class MixingOrderScreen extends StatefulWidget {
  @override
  State<MixingOrderScreen> createState() => _MixingOrderScreenState();
}

class _MixingOrderScreenState extends State<MixingOrderScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // List of widgets for each tab
    final List<Widget> pages = [
      Padding(
        padding: EdgeInsets.only(
            bottom: screenHeight / 13), // Add bottom padding here
        child: OrderListPage(),
      ),
      Padding(
        padding: EdgeInsets.only(
            bottom: screenHeight / 13), // Add bottom padding here
        child: CreateMixIncomeOrderPage(),
      ),
    ];
    return Scaffold(
      extendBody: true, // Extends body under the navigation bar
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        child: GlassmorphicBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
