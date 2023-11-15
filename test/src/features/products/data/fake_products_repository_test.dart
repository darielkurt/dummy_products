import 'package:dummy_products/src/constants/test_products.dart';
import 'package:dummy_products/src/features/product/data/fake_products_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FakeProductsRepository makeProductsRepository() => FakeProductsRepository();

  group('FakeProductsRepository', () {
    test('getProductsList returns global list', () {
      final productsRepository = makeProductsRepository();
      expect(
        productsRepository.getProductsList(),
        kTestProducts,
      );
    });

    test('getProduct(2) returns first item', () {
      final productsRepository = makeProductsRepository();
      expect(
        productsRepository.getProductById(2),
        kTestProducts[0],
      );
    });
  });
}
