import 'package:dummy_products/src/core/client/dio_provider.dart';
import 'package:dummy_products/src/features/product/data/product_repository.dart';
import 'package:dummy_products/src/features/product/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider = Provider<ProductsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductsRepositoryImpl(dio);
});

final productFutureProvider =
    FutureProvider.autoDispose.family<ProductModel, int>((ref, id) async {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.getProductById(id);
});
