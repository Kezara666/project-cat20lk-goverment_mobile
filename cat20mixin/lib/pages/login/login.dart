import 'dart:convert';
import 'dart:ui';
import 'package:cat20mixing/enviroment/api.dart';
import 'package:cat20mixing/services/user_managmenet_controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserController userController = Get.find();
  bool _isPasswordVisible = false;
  String _connectionStatus = 'Unknown';
  final _storage = FlutterSecureStorage();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkConnection(); // Check internet connection when the screen is initialized
  }

  // Function to check internet connection
  Future<void> _checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      if (connectivityResult == ConnectivityResult.mobile) {
        _connectionStatus = 'Connected to Mobile Network';
      } else if (connectivityResult == ConnectivityResult.wifi) {
        _connectionStatus = 'Connected to WiFi';
      } else {
        _connectionStatus = 'No Internet Connection';
      }
    });
  }

  // Function to perform login
  Future<void> _login() async {
    // Prepare the login request
    var url = Uri.parse('$backendAPI/api/auth/login/newlogin');
    var response = await http.post(
      headers: {
        'Content-Type': 'application/json', // Set appropriate headers
        'Authorization': 'Bearer ${userController.currentToken}'
      },
      url,
      body: jsonEncode({
        // 'username': _usernameController.text,
        // 'password': _passwordController.text,
        'username': 'lahiru@cat20.lk',
         'password': 'cat2020admin',
        'operatingSystem': 'Android',
        'browser': 'Chrome',
        'device': 'Pixel',
        'osVersion': '10.0',
        'browserVersion': '91.0',
        'deviceType': 'mobile',
        'orientation': 'portrait',
        'ipAddress': '192.168.0.1',
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['token'] != null) {
        // Save user data in the GetX controller
        userController.saveUserData(data['token'], data['expiration']);
        userController.update();

        // Navigate to the next screen
        // Get.offNamed('/home');
      } else {
        Get.snackbar(
          'Credential Wrong',
          'Credential Wrong Please Try Again',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.transparent,
          messageText: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(150, 209, 25, 25), // Semi-transparent red
              borderRadius: BorderRadius.circular(12), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 2), // Shadow effect
                ),
              ],
            ),
            child: Text(
              'Credential Wrong Please Try Again',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
    } else {
      Get.snackbar(
        'Credential Wrong',
        'Credential Wrong Please Try Again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.transparent,
        messageText: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(150, 209, 25, 25), // Semi-transparent red
            borderRadius: BorderRadius.circular(12), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2), // Shadow effect
              ),
            ],
          ),
          child: Text(
            'Credential Wrong Please Try Again',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // Dismiss the keyboard
          },
          child: _connectionStatus != 'Connected to Mobile Network' ||
                  _connectionStatus != 'Connected to WiFi'
              ? Container(
                  height: screenHeight,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue, // Start color
                        Colors.green, // End color
                      ],
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.all(screenWidth * 0.05), // Dynamic padding
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            width: screenWidth * 0.9, // Dynamic width
                            padding: EdgeInsets.all(screenWidth * 0.05),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.2)),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: screenHeight * 0.1,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/govlogo.jpg'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Text(
                                  'CAT20 Login',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.06,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                Form(
                                  child: Column(
                                    children: [
                                      // Username Field
                                      TextFormField(
                                        controller: _usernameController,
                                        decoration: InputDecoration(
                                          labelText: 'Username',
                                          filled: true,
                                          fillColor:
                                              Colors.white.withOpacity(0.7),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                screenWidth * 0.03),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.02),
                                      // Password Field
                                      TextFormField(
                                        controller: _passwordController,
                                        obscureText: !_isPasswordVisible,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          filled: true,
                                          fillColor:
                                              Colors.white.withOpacity(0.7),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                screenWidth * 0.03),
                                            borderSide: BorderSide.none,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _isPasswordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _isPasswordVisible =
                                                    !_isPasswordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.02),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.035,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: _login,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blueAccent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                screenWidth * 0.03),
                                          ),
                                          minimumSize: Size.fromHeight(
                                              screenHeight * 0.07),
                                        ),
                                        child: Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.045),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                Text(
                                  'Ministry of Public Administration,\nHome Affairs, Provincial Councils and Local Government',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Container(
                                  height: screenHeight * 0.1,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/UNDPBanner.jpg'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
