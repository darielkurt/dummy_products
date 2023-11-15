import 'package:dummy_products/src/pages/product_list_screen.dart';
import 'package:dummy_products/src/pages/view_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  product,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const ProductListScreen(),
        routes: [
          GoRoute(
            path: 'product/:id',
            name: AppRoute.product.name,
            pageBuilder: (context, state) {
              final id = state.pathParameters['id'];
              return MaterialPage(child: ViewProductScreen(id: int.parse(id!)));
            },
          ),
        ],
      ),
    ],
  );
});
