import 'package:dummy_products/src/constants/test_products.dart';
import 'package:dummy_products/src/features/product/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeProductsRepository {
  final List<Product> _products = kTestProducts;

  List<Product> getProductsList() {
    return _products;
  }

  Product? getProductById(int id) {
    return _getProductById(_products, id);
  }

  Future<List<Product>> fetchProductsList() async {
    return Future.value(_products);
  }

  static Product? _getProductById(List<Product> products, int id) {
    try {
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}

final productsRepositoryProvider = Provider<FakeProductsRepository>((ref) {
  return FakeProductsRepository();
});

final productsListFutureProvider =
    FutureProvider.autoDispose<List<Product>>((ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.fetchProductsList();
});
