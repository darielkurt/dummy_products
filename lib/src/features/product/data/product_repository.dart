import 'package:dio/dio.dart';
import 'package:dummy_products/src/core/constants/products.dart';
import 'package:dummy_products/src/features/product/domain/product.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  ProductsRepositoryImpl(this.dio);
  final Dio dio;

  @override
  Future<ProductModel> getProductById(int id) async {
    final result = await dio.get('$kProductUrl/$id');

    if (result.data != null) {
      final product = ProductModel.fromMap(result.data);
      return product;
    }

    // TODO error handling
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProductsList(
      {required int page, required int limit}) async {
    final skip = page * 10;
    final result = await dio.get(
        '$kProductUrl?limit=$limit&skip=$skip&select=title,price,thumbnail,stock,discountPercentage');

    if (result.data != null) {
      final List productJsonList = result.data['products'] ?? [];
      final List<ProductModel> productList =
          productJsonList.map((e) => ProductModel.fromMap(e)).toList();
      return productList;
    }

    // TODO error handling
    throw UnimplementedError();
  }
}

abstract class ProductsRepository {
  Future<ProductModel> getProductById(int id);
  Future<List<ProductModel>> getProductsList(
      {required int page, required int limit});
}
