import 'package:trailtrekker_app/app/navigator_key/navigator_key.dart';
import 'package:trailtrekker_app/app/themes/app_theme.dart';
import 'package:trailtrekker_app/features/auth/presentation/view/register_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trailtrekker_app/features/censor/presentation/accelerometer.dart';
import 'package:trailtrekker_app/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:trailtrekker_app/features/splash/presentation/view/splash_view.dart';



class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Application',
      theme: AppTheme.getApplicationTheme(false),
      // home: DashboardView(),
      home: AccelerometerScreen(),
    );
  }
}