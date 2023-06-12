import 'package:dummy_products/features/product/presentation/product_list/product_list.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Catalog',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const ProductList(),
    );
  }
}
