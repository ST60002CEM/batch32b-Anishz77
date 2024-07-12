import 'package:trailtrekker_app/features/dashboard/data/model/product.dart';
import 'package:trailtrekker_app/features/dashboard/data/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts(int page, int limit) async {
    // Define the products
    Product sideBag = Product(
      name: 'SideBag',
      price: 'Rs 2400',
      image: 'assets/image/sidebag.webp',
    );

    Product peakPack = Product(
      name: 'PeakPack',
      price: 'Rs 3000',
      image: 'assets/image/peakpack.webp',
    );

    Product hikie = Product(
      name: 'Hikie',
      price: 'Rs 1800',
      image: 'assets/image/Hikie.webp',
    );

    Product rodless = Product(
      name: 'Rodless',
      price: 'Rs 1900',
      image: 'assets/image/casualbag.webp',
    );

    // Simulate pagination
    return Future.delayed(Duration(seconds: 1), () {
      // Create a list of products, cycling through SideBag, PeakPack, Hikie, and Rodless
      List<Product> products = List<Product>.generate(limit, (index) {
        switch (index % 4) {
          case 0:
            return sideBag;
          case 1:
            return peakPack;
          case 2:
            return hikie;
          case 3:
            return rodless;
          default:
            return sideBag; // Default case to handle any unexpected values
        }
      });
      return products;
    });
  }
}
