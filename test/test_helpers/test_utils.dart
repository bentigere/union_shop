import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/collection_products_page.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/login_page.dart';
import 'package:union_shop/print_shack_about_page.dart';
import 'package:union_shop/print_shack_page.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/register_page.dart';
import 'package:union_shop/sale_page.dart';
import 'package:union_shop/search_page.dart';

/// Wrapper to handle network images in tests
Future<void> pumpWidgetWithMocks(
  WidgetTester tester,
  Widget widget,
) async {
  await mockNetworkImagesFor(() => tester.pumpWidget(widget));
}

/// Creates a MaterialApp wrapper for testing widgets
Widget createTestableWidget(Widget child) {
  return MaterialApp(
    home: Scaffold(body: child),
  );
}

/// Creates a full MaterialApp with routes for integration tests
Widget createTestableApp(Widget home) {
  return MaterialApp(
    home: home,
    routes: {
      '/product': (context) => const ProductPage(),
      '/about': (context) => const AboutPage(),
      '/sale': (context) => const SalePage(),
      '/login': (context) => const LoginPage(),
      '/collections': (context) => const CollectionsPage(),
      '/collection-products': (context) => const CollectionProductsPage(),
      '/cart': (context) => const CartPage(),
      '/print-shack': (context) => const PrintShackPage(),
      '/print-shack-about': (context) => const PrintShackAboutPage(),
      '/search': (context) => const SearchPage(),
      '/register': (context) => const RegisterPage(),
    },
  );
}
