import 'package:dummy_products/src/features/product/domain/product.dart';
import 'package:dummy_products/src/features/product/presentation/product_item.dart';
import 'package:dummy_products/src/features/product/presentation/product_list/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class ProductList extends ConsumerWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RiverPagedBuilder<int, ProductModel>(
      limit: 10,
      firstPageKey: 0,
      provider: productListControllerProvider,
      itemBuilder: (context, product, index) {
        return ProductItem(
          id: product.id,
          title: product.title,
          price: product.price,
          thumbnail: product.thumbnail,
          stock: product.stock,
          discountPercentage: product.discountPercentage,
        );
      },
      pagedBuilder: (controller, builder) => PagedListView(
          pagingController: controller,
          builderDelegate: builder,
          padding: const EdgeInsets.symmetric(vertical: 12.0)),
      noMoreItemsIndicatorBuilder: (context, pagingController) {
        final titleMedium = Theme.of(context).textTheme.titleMedium;
        return Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text('More products for you soon!', style: titleMedium),
        ));
      },
    );
  }
}
