import 'package:dummy_products/src/core/widgets/error_screen.dart';
import 'package:dummy_products/src/core/widgets/loading_screen.dart';
import 'package:dummy_products/src/features/product/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dummy_products/src/features/product/presentation/view_product/category_section.dart';
import 'package:dummy_products/src/features/product/presentation/view_product/description_section.dart';
import 'package:dummy_products/src/features/product/presentation/view_product/images_section.dart';
import 'package:dummy_products/src/features/product/presentation/view_product/price_section.dart';
import 'package:dummy_products/src/features/product/presentation/view_product/rating_section.dart';
import 'package:dummy_products/src/features/product/presentation/view_product/title_section.dart';

class ViewProductScreen extends ConsumerWidget {
  final int id;
  const ViewProductScreen({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProduct = ref.watch(productFutureProvider(id));

    return asyncProduct.when(
      data: (product) {
        final title = product.title ?? '-';
        final description = product.description ?? '-';
        final price = product.price;
        final stock = product.stock;
        final rating = product.rating;
        final discountPercentage = product.discountPercentage;
        final category = product.category;
        final imageUrls = product.images;

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                TitleSection(title: title),
                const SizedBox(height: 8),
                DescriptionSection(description: description),
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(imageUrls?[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                PriceSection(
                  price: price,
                  discountPercentage: discountPercentage,
                ),
                const SizedBox(height: 8),
                RatingSection(
                  rating: rating,
                  stock: stock,
                ),
                const SizedBox(height: 16),
                const Divider(),
                ImagesSection(
                  imageUrls: imageUrls ?? [],
                ),
                const Divider(),
                const SizedBox(height: 16),
                CategorySection(category: category),
              ],
            ),
          ),
        );
      },
      error: (_, __) => ErrorScreen(
        onRetry: () => ref.invalidate(productFutureProvider(id)),
      ),
      loading: () => const LoadingScreen(),
    );
  }
}
