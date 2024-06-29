import 'package:trailtrekker_app/features/dashboard/data/model/product.dart';
import 'package:trailtrekker_app/features/dashboard/data/repository/product_repository.dart';


class FetchProductsUseCase {
  final ProductRepository repository;

  FetchProductsUseCase(this.repository);

  Future<List<Product>> call(int page, int limit) {
    return repository.fetchProducts(page, limit);
  }
}
