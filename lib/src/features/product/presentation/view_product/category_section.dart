import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final String? category;
  const CategorySection({this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Chip(
            label: Text(category ?? '-'),
          ),
        ],
      ),
    );
  }
}
