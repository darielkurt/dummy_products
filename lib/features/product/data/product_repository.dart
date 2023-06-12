import 'package:dio/dio.dart';
import 'package:dummy_products/features/product/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsRepository {
  final Dio dio = Dio();

  Future<Product> fetchById(int id) async {
    final result = await dio.get('https://dummyjson.com/products/$id');

    if (result.data != null) {
      final product = Product.fromMap(result.data);
      return product;
    }

    throw UnimplementedError();
  }
}

final productRepositoryProvider =
    Provider.autoDispose<ProductsRepository>((ref) {
  return ProductsRepository();
});

final productFutureProvider =
    FutureProvider.autoDispose.family<Product, int>((ref, id) async {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.fetchById(id);
});
