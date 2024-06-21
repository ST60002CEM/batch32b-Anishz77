import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trailtrekker_app/app/app.dart';
import 'package:trailtrekker_app/core/networking/local/hive_service.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await HiveService().init();
  runApp(const ProviderScope(child: App()));
}
