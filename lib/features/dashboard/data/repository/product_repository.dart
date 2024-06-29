import 'package:trailtrekker_app/features/dashboard/data/model/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts(int page, int limit);
}
