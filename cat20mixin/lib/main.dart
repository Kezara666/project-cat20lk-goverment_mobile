import 'dart:ui';

import 'package:cat20mixing/pages/login/login.dart';
import 'package:cat20mixing/pages/mix_income/list_order.dart';
import 'package:cat20mixing/services/user_managmenet_controller/user_controller.dart';
import 'package:cat20mixing/widgets/glass_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:cat20mixing/providers/init_controllers.dart' as di;
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'pages/mix_income/add_order_page.dart';

void main() async {
  await di.init();
  Get.put(UserController()); // Ensure persistent controller initialization
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginCheck(),
      ),
    ),
  );
}

class LoginCheck extends StatelessWidget {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return userController.currentUserId.value.isEmpty
          ? LoginScreen()
          : MainScreen();
    });
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndexMainDrawer = 0;
  final UserController userController = Get.find();

  final List<Widget> _pages = [
    OrderListPage(),
    CreateMixIncomeOrderPage(),
    AssessmentPage(),
  ];

  _buildDrawerItem(int index, IconData icon, String title) {
  bool isSelected = _currentIndexMainDrawer == index;
  return isSelected
      ? Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2), // Glass effect for selected icon
            borderRadius: BorderRadius.circular(8.0), // Optional: rounded corners
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.white),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _currentIndexMainDrawer = index;
              });
            },
          ),
        )
      : ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            setState(() {
              _currentIndexMainDrawer = index;
            });
          },
        );
}


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final userName = userController.currentUserName.value;

    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(
                    255, 16, 82, 214), // Light blue color (like noon light)
                Color.fromARGB(255, 219, 13, 174),
                // Slightly lighter blue
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
            ),
            borderRadius:
                BorderRadius.circular(20), // Optional, for rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.1), // Optional, subtle shadow effect
                blurRadius: 8.0, // Slight blur for a soft effect
                offset: Offset(0, 4), // Shadow offset
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: GlassmorphicContainer(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.9,
                  borderRadius: 0,
                  blur: 100,
                  alignment: Alignment.bottomCenter,
                  border: 0,
                  linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 244, 239, 239).withOpacity(0.1),
                      Color.fromARGB(255, 236, 236, 238).withOpacity(0.05),
                    ],
                    stops: [0.1, 1],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 248, 245, 245).withOpacity(0.1),
                      Color.fromARGB(255, 245, 244, 247).withOpacity(0.05),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: screenWidth * 0.4, // Adjust size as needed
                            backgroundImage: NetworkImage(
                                'https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=2449'), // Add your image URL here
                            backgroundColor: Colors
                                .transparent, // Optional, if you want a transparent background
                          ),
                        ),
                        SizedBox(
                          height: screenHeight / 30,
                        ),
                        Center(
                          child: Text(
                            'Hello $userName',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight / 20,
                        ),
                        Divider(),
                        _buildDrawerItem(0, Icons.shopping_bag, 'Mixing Orders'),
                      _buildDrawerItem(1, Icons.add_box, 'Create Mixing Order'),
                      _buildDrawerItem(2, Icons.assessment, 'Assessment'),
                      
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.logout, color: Colors.redAccent),
                          title: Text('Logout',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Add your logout logic here
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Full glass effect background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0), // Transparent background
            ),
          ),
          IndexedStack(
            index: _currentIndexMainDrawer,
            children: _pages,
          ),
        ],
      ),
      bottomNavigationBar: _currentIndexMainDrawer < 2
          ? AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: GlassmorphicBottomBar(
                currentIndex: _currentIndexMainDrawer,
                onTap: (index) {
                  setState(() {
                    _currentIndexMainDrawer = index;
                  });
                },
              ),
            )
          : Container(),
    );
  }
  
}

class AssessmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Assessment Page Content",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
