import 'package:flutter/material.dart';
import 'package:trailtrekker_app/screen/about_screen.dart';
import 'package:trailtrekker_app/screen/cart_screen.dart';
import 'package:trailtrekker_app/screen/profile_screen.dart';
import 'package:trailtrekker_app/screen/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  List<Widget> lstBottomScreen = [
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the login page
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(right: 270.0, top: 20.0),
                child: const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 100.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    height: 110.0,
                    color: Colors.grey,
                    child: Image.asset('assets/image/cart.jpg'), // Replace 'assets/images/image1.png' with your image asset path
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button tap
                    },
                    child: const Text('Find Destinations'),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 190.0,
                    height: 120.0,
                    color: Colors.grey,
                    child: Image.asset('assets/image/destination.jpg'), // Replace 'assets/images/image2.png' with your image asset path
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button tap
                    },
                    child: const Text('Go Shopping'),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[600],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          iconSize: 40.0, // Adjust the size as needed
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const DashboardScreen());
}
