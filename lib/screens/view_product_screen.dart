import 'package:dummy_products/features/product/data/product_repository.dart';
import 'package:dummy_products/features/product/presentation/view_product/category_section.dart';
import 'package:dummy_products/features/product/presentation/view_product/images_section.dart';
import 'package:dummy_products/features/product/presentation/view_product/price_section.dart';
import 'package:dummy_products/features/product/presentation/view_product/rating_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
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
      error: (_, __) => const SizedBox.shrink(),
      loading: () => const Divider(),
    );
  }
}
