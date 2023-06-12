import 'package:dio/dio.dart';
import 'package:dummy_products/features/product/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class ProductListNotifier extends PagedNotifier<int, Product> {
  ProductListNotifier()
      : super(
          load: (page, limit) async {
            final result = await Dio().get(
                'https://dummyjson.com/products?limit=$limit&skip=$page&select=title,price,thumbnail,stock,discountPercentage');

            if (result.data != null) {
              final List productJsonList = result.data['products'] ?? [];
              final List<Product> productList =
                  productJsonList.map((e) => Product.fromMap(e)).toList();
              return productList;
            }

            throw UnimplementedError();
          },
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );

  void add(Product product) {
    state = state.copyWith(records: [...(state.records ?? []), product]);
  }

  void delete(Product post) {
    state = state.copyWith(records: [...(state.records ?? [])]..remove(post));
  }
}

final productListControllerProvider =
    StateNotifierProvider<ProductListNotifier, PagedState<int, Product>>(
        (_) => ProductListNotifier());
