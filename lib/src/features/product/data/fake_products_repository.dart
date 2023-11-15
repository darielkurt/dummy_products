import 'package:collection/collection.dart';
import 'package:dummy_products/src/constants/test_products.dart';
import 'package:dummy_products/src/features/product/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeProductsRepository {
  final List<Product> _products = kTestProducts;

  List<Product> _getProductsList() {
    return _products;
  }

  Product? getProductById(int id) {
    return _getProductById(_products, id);
  }

  Future<List<Product>> getProductsList() async {
    return Future.value(_products);
  }

  static Product? _getProductById(List<Product> products, int id) {
    return products.firstWhereOrNull((product) => product.id == id);
  }
}

final productsRepositoryProvider = Provider<FakeProductsRepository>((ref) {
  return FakeProductsRepository();
});
