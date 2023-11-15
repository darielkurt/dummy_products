import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  final double? rating;
  final int? stock;
  const RatingSection({this.rating, this.stock, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellow,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            rating?.toStringAsFixed(1) ?? '-',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '(${stock.toString()} in stock)',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
