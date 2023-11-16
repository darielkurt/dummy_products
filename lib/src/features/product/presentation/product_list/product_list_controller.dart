import 'package:dummy_products/src/features/product/data/product_repository.dart';
import 'package:dummy_products/src/features/product/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class ProductListNotifier extends PagedNotifier<int, ProductModel> {
  final ProductsRepository productRepository;

  ProductListNotifier(this.productRepository)
      : super(
          load: (page, limit) async {
            return productRepository.getProductsList(page: page, limit: limit);
          },
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );
}

final productListControllerProvider =
    StateNotifierProvider<ProductListNotifier, PagedState<int, ProductModel>>((ref) {
  final productRepository = ref.watch(productRepositoryProvider);
  return ProductListNotifier(productRepository);
});
