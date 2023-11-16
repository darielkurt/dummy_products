import 'package:dio/dio.dart';
import 'package:dummy_products/src/core/client/dio_provider.dart';
import 'package:dummy_products/src/features/product/data/constants.dart';
import 'package:dummy_products/src/features/product/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsRepository {
  ProductsRepository(this.dio);
  final Dio dio;

  Future<ProductModel> getProductById(int id) async {
    final result = await dio.get('$kProductUrl/$id');

    if (result.data != null) {
      final product = ProductModel.fromMap(result.data);
      return product;
    }

    // TODO error handling
    throw UnimplementedError();
  }

  Future<List<ProductModel>> getProductsList(
      {required int page, required int limit}) async {
    final skip = page * 10;
    final result = await dio.get(
        '$kProductUrl?limit=$limit&skip=$skip&select=title,price,thumbnail,stock,discountPercentage');

    if (result.data != null) {
      final List productJsonList = result.data['products'] ?? [];
      final List<ProductModel> productList =
          productJsonList.map((e) => ProductModel.fromMap(e)).toList();
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
    FutureProvider.autoDispose.family<ProductModel, int>((ref, id) async {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.getProductById(id);
});
