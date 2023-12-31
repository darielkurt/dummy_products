import 'package:dummy_products/src/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatelessWidget {
  final int? id;
  final String? title;
  final int? price;
  final String? thumbnail;
  final int? stock;
  final double? discountPercentage;
  const ProductItem({
    this.id,
    this.title,
    this.price,
    this.thumbnail,
    this.stock,
    this.discountPercentage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 12,
      onTap: () {
        if (id == null) return;

        context.pushNamed(AppRoute.product.name,
            pathParameters: {'id': id.toString()});
      },
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Text(
          '${discountPercentage?.toStringAsFixed(0)}% OFF',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
      leading: Image.network(
        thumbnail ?? '-',
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
      title: Text(
        title ?? '-',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(
            '\$${price?.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Stock: $stock',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
