import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
    );
  }
}