import 'package:dio/dio.dart';
import 'package:dummy_products/src/client/dio_provider.dart';
import 'package:dummy_products/src/features/product/data/constants.dart';
import 'package:dummy_products/src/features/product/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsRepository {
  ProductsRepository(this.dio);
  final Dio dio;

  Future<Product> getProductById(int id) async {
    final result = await dio.get('$kProductUrl/$id');

    if (result.data != null) {
      final product = Product.fromMap(result.data);
      return product;
    }

    // TODO error handling
    throw UnimplementedError();
  }

  Future<List<Product>> getProductsList(int page, int limit) async {
    final skip = page * 10;
    final result = await dio.get(
        '$kProductUrl?limit=$limit&skip=$skip&select=title,price,thumbnail,stock,discountPercentage');

    if (result.data != null) {
      final List productJsonList = result.data['products'] ?? [];
      final List<Product> productList =
          productJsonList.map((e) => Product.fromMap(e)).toList();
      return productList;
    }

    throw UnimplementedError();
  }
}

final productRepositoryProvider = Provider<ProductsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductsRepository(dio);
});

final productFutureProvider =
    FutureProvider.autoDispose.family<Product, int>((ref, id) async {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.getProductById(id);
});
