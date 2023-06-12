import 'package:flutter/material.dart';

class PriceSection extends StatelessWidget {
  final int? price;
  final double? discountPercentage;
  const PriceSection({this.price, this.discountPercentage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$${price?.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${discountPercentage?.toStringAsFixed(0)}% OFF',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
