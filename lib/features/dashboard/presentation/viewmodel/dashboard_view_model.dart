import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardViewModel extends ChangeNotifier {
  // Example data, replace with your own logic
  List<Map<String, String>> featuredProducts = [
    {'name': 'SideBag', 'price': '\Rs 2400', 'image': 'assets/image/sidebag.webp'},
    {'name': 'PeakPack', 'price': '\Rs 3000', 'image': 'assets/image/peakpack.webp'},
    {'name': 'Hikie', 'price': '\Rs1800', 'image': 'assets/image/wiry.webp'},
  ];

  List<Map<String, String>> popularProducts = [
    {'name': 'CasualBag', 'price': '\$2400', 'image': 'assets/image/sidebag.webp'},
    {'name': 'Wiry', 'price': '\Rs2700', 'image': 'assets/image/wiry.webp'},
    {'name': 'Rodless', 'price': '\Rs1900', 'image': 'assets/image/casualbag.webp'},
  ];

  void fetchFeaturedProducts() {
    // Fetch the featured products and notify listeners
    notifyListeners();
  }

  void fetchPopularProducts() {
    // Fetch the most popular products and notify listeners
    notifyListeners();
  }
}

final dashboardViewModelProvider = ChangeNotifierProvider((_) => DashboardViewModel());
