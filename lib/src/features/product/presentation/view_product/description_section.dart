import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  final String? description;
  const DescriptionSection({this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        description ?? '-',
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
