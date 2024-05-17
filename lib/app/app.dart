import 'package:flutter/material.dart';
import 'package:trailtrekker_app/screen/signup_screen.dart';

import '../screen/login_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
    );
  }
}