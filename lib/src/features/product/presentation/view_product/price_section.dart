import 'package:flutter/material.dart';

class PriceSection extends StatelessWidget {
  final int? price;
  final double? discountPercentage;
  const PriceSection({this.price, this.discountPercentage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '\$${price?.toStringAsFixed(2)}',
        style: titleLarge,
      ),
    );
  }
}
