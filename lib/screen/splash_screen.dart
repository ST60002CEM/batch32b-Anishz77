import 'package:final_project/screen/signup_screen.dart';
import 'package:flutter/material.dart';
 
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
 
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to simulate the splash screen duration
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the sign-up screen after the delay
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignUpScreen()),
      );
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display your custom image logo using Image.asset
            Image.asset(
              'assets/images/trekking.webp', // Replace 'assets/logo.png' with your image file path
              width: 300, // Adjust width as needed
              height: 300, // Adjust height as needed
            ),
            SizedBox(height: 10), // Add some space between the image and text
            // Text "since 2024" aligned to the right-hand side
            Text(
              'Trail Trekker',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 