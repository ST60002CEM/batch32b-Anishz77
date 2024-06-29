import 'package:trailtrekker_app/features/dashboard/data/model/product.dart';
import 'package:trailtrekker_app/features/dashboard/data/repository/product_repository.dart';


class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts(int page, int limit) async {
    // Single product (SideBag) repeated for pagination
    Product sideBag = Product(
      name: 'SideBag',
      price: 'Rs 2400',
      image: 'assets/image/sidebag.webp',
    );

    // Simulate pagination
    return Future.delayed(Duration(seconds: 1), () {
      return List<Product>.filled(limit, sideBag);
    });
  }
}
