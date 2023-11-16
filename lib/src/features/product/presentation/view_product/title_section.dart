import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String? title;
  final double? discountPercentage;
  const TitleSection({this.title, this.discountPercentage, super.key});

  @override
  Widget build(BuildContext context) {
    final titleMedium = Theme.of(context).textTheme.titleMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '-',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${discountPercentage?.toStringAsFixed(0)}% OFF',
            style: titleMedium?.copyWith(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
