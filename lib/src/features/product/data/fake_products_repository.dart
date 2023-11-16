import 'package:collection/collection.dart';
import 'package:dummy_products/src/core/constants/test_products.dart';
import 'package:dummy_products/src/features/product/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeProductsRepository {
  final List<ProductModel> _products = kTestProducts;

  ProductModel? getProductById(int id) {
    return _getProductById(_products, id);
  }

  Future<List<ProductModel>> getProductsList() async {
    return Future.value(_products);
  }

  static ProductModel? _getProductById(List<ProductModel> products, int id) {
    return products.firstWhereOrNull((product) => product.id == id);
  }
}

final productsRepositoryProvider = Provider<FakeProductsRepository>((ref) {
  return FakeProductsRepository();
});
