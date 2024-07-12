import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trailtrekker_app/features/dashboard/data/model/product.dart';
import 'package:trailtrekker_app/features/dashboard/data/repository/product_repository_impl.dart';
import 'package:trailtrekker_app/features/dashboard/domain/use_case/fetch_products_use_case.dart';


class PaginatedProductsViewModel extends ChangeNotifier {
  final FetchProductsUseCase fetchProductsUseCase;
  List<Product> products = [];
  int currentPage = 0;
  final int itemsPerPage = 5; // Limit to 10 items per page
  bool isLoading = false;
  bool hasMore = true;

  PaginatedProductsViewModel(this.fetchProductsUseCase);

  Future<void> fetchProducts() async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    final newProducts = await fetchProductsUseCase(currentPage, itemsPerPage);
    if (newProducts.isEmpty) {
      hasMore = false;
    } else {
      products.addAll(newProducts);
      currentPage++;
    }
    isLoading = false;
    notifyListeners();
  }
}

final paginatedProductsViewModelProvider = ChangeNotifierProvider((ref) {
  final repository = ProductRepositoryImpl();
  final fetchProductsUseCase = FetchProductsUseCase(repository);
  return PaginatedProductsViewModel(fetchProductsUseCase);
});