import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/product_service.dart';

void main() {
  group('Product Service Tests', () {
    late ProductService service;

    setUp(() {
      service = ProductService();
    });

    test('getProducts returns non-empty list', () {
      final products = service.getProducts();
      
      expect(products, isNotEmpty);
      expect(products.length, greaterThanOrEqualTo(10));
    });

    test('getProducts filters by collectionId', () {
      final products = service.getProducts(collectionId: 'clothing');
      
      expect(products, isNotEmpty);
      for (var product in products) {
        expect(product.collectionId, 'clothing');
      }
    });

    test('getProducts returns all products when collectionId is "all"', () {
      final allProducts = service.getProducts();
      final allProductsExplicit = service.getProducts(collectionId: 'all');
      
      expect(allProductsExplicit.length, allProducts.length);
    });

    test('getProducts filters by size', () {
      final products = service.getProducts(filterSize: 'M');
      
      expect(products, isNotEmpty);
      for (var product in products) {
        expect(product.sizes.contains('M'), true);
      }
    });

    test('getProducts filters by color', () {
      final products = service.getProducts(filterColor: 'Black');
      
      expect(products, isNotEmpty);
      for (var product in products) {
        expect(product.colors.contains('Black'), true);
      }
    });

    test('getProducts does not filter when size is "All"', () {
      final allProducts = service.getProducts();
      final filteredProducts = service.getProducts(filterSize: 'All');
      
      expect(filteredProducts.length, allProducts.length);
    });

    test('getProducts does not filter when color is "All"', () {
      final allProducts = service.getProducts();
      final filteredProducts = service.getProducts(filterColor: 'All');
      
      expect(filteredProducts.length, allProducts.length);
    });

    test('getProducts sorts by price low to high', () {
      final products = service.getProducts(sortBy: 'Price: Low to High');
      
      expect(products, isNotEmpty);
      for (int i = 0; i < products.length - 1; i++) {
        expect(products[i].price, lessThanOrEqualTo(products[i + 1].price));
      }
    });

    test('getProducts sorts by price high to low', () {
      final products = service.getProducts(sortBy: 'Price: High to Low');
      
      expect(products, isNotEmpty);
      for (int i = 0; i < products.length - 1; i++) {
        expect(products[i].price, greaterThanOrEqualTo(products[i + 1].price));
      }
    });

    test('getProducts sorts by name A-Z', () {
      final products = service.getProducts(sortBy: 'Name: A-Z');
      
      expect(products, isNotEmpty);
      for (int i = 0; i < products.length - 1; i++) {
        expect(
          products[i].title.toLowerCase().compareTo(products[i + 1].title.toLowerCase()) <= 0,
          true,
        );
      }
    });

    test('getProducts applies multiple filters simultaneously', () {
      final products = service.getProducts(
        collectionId: 'clothing',
        filterSize: 'M',
        filterColor: 'Navy',
      );
      
      for (var product in products) {
        expect(product.collectionId, 'clothing');
        expect(product.sizes.contains('M'), true);
        expect(product.colors.contains('Navy'), true);
      }
    });

    test('searchProducts filters by title', () {
      final products = service.searchProducts('hoodie');
      
      expect(products, isNotEmpty);
      for (var product in products) {
        expect(product.title.toLowerCase(), contains('hoodie'));
      }
    });

    test('searchProducts is case insensitive', () {
      final productsLower = service.searchProducts('hoodie');
      final productsUpper = service.searchProducts('HOODIE');
      final productsMixed = service.searchProducts('HoOdIe');
      
      expect(productsLower.length, productsUpper.length);
      expect(productsLower.length, productsMixed.length);
    });

    test('searchProducts returns empty for non-existent item', () {
      final products = service.searchProducts('xyznonexistent123');
      
      expect(products, isEmpty);
    });

    test('searchProducts returns empty for empty query', () {
      final products = service.searchProducts('');
      
      expect(products, isEmpty);
    });

    test('searchProducts finds partial matches', () {
      final products = service.searchProducts('tee');
      
      expect(products, isNotEmpty);
      for (var product in products) {
        expect(product.title.toLowerCase(), contains('tee'));
      }
    });

    test('getProductById returns correct product', () {
      final product = service.getProductById('1');
      
      expect(product, isNotNull);
      expect(product?.id, '1');
      expect(product?.title, contains('University Hoodie'));
    });

    test('getProductById returns null for invalid id', () {
      final product = service.getProductById('invalid_id_999');
      
      expect(product, isNull);
    });

    test('getProductById works with all valid IDs', () {
      final allProducts = service.getProducts();
      
      for (var p in allProducts) {
        final found = service.getProductById(p.id);
        expect(found, isNotNull);
        expect(found?.id, p.id);
      }
    });

    test('Products have required fields', () {
      final products = service.getProducts();
      
      for (var product in products) {
        expect(product.id, isNotEmpty);
        expect(product.title, isNotEmpty);
        expect(product.price, greaterThan(0));
        expect(product.imageUrl, isNotEmpty);
        expect(product.collectionId, isNotEmpty);
      }
    });

    test('Filtering by non-existent collection returns empty list', () {
      final products = service.getProducts(collectionId: 'nonexistent');
      
      expect(products, isEmpty);
    });

    test('Filtering by non-existent size returns empty list', () {
      final products = service.getProducts(filterSize: 'XXXXL');
      
      expect(products, isEmpty);
    });

    test('Filtering by non-existent color returns empty list', () {
      final products = service.getProducts(filterColor: 'Rainbow');
      
      expect(products, isEmpty);
    });
  });
}
