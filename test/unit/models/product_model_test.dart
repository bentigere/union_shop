import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product_model.dart';

void main() {
  group('Product Model Tests', () {
    test('Product model initializes correctly', () {
      const product = Product(
        id: '1',
        title: 'Test Hoodie',
        price: 29.99,
        imageUrl: 'https://example.com/hoodie.jpg',
        collectionId: 'clothing',
        sizes: ['S', 'M', 'L'],
        colors: ['Black', 'Navy'],
      );

      expect(product.id, '1');
      expect(product.title, 'Test Hoodie');
      expect(product.price, 29.99);
      expect(product.imageUrl, 'https://example.com/hoodie.jpg');
      expect(product.collectionId, 'clothing');
      expect(product.sizes, ['S', 'M', 'L']);
      expect(product.colors, ['Black', 'Navy']);
      expect(product.originalPrice, isNull);
    });

    test('Product with originalPrice shows discount', () {
      const product = Product(
        id: '2',
        title: 'Sale Item',
        price: 19.99,
        originalPrice: 29.99,
        imageUrl: 'https://example.com/item.jpg',
        collectionId: 'sale',
      );

      expect(product.price, 19.99);
      expect(product.originalPrice, 29.99);
      expect(product.originalPrice! > product.price, true);
    });

    test('Product with empty sizes and colors', () {
      const product = Product(
        id: '3',
        title: 'One Size Item',
        price: 9.99,
        imageUrl: 'https://example.com/item.jpg',
        collectionId: 'accessories',
      );

      expect(product.sizes, isEmpty);
      expect(product.colors, isEmpty);
    });

    test('Product equality comparison', () {
      const product1 = Product(
        id: '1',
        title: 'Item',
        price: 10.0,
        imageUrl: 'test.jpg',
        collectionId: 'test',
      );

      const product2 = Product(
        id: '1',
        title: 'Item',
        price: 10.0,
        imageUrl: 'test.jpg',
        collectionId: 'test',
      );

      // Since Product is a const class, identical const instances should be equal
      expect(product1.id, product2.id);
      expect(product1.title, product2.title);
      expect(product1.price, product2.price);
    });

    test('Product with multiple sizes', () {
      const product = Product(
        id: '4',
        title: 'Multi-size Item',
        price: 24.99,
        imageUrl: 'https://example.com/item.jpg',
        collectionId: 'clothing',
        sizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
      );

      expect(product.sizes.length, 6);
      expect(product.sizes.contains('M'), true);
      expect(product.sizes.contains('XXL'), true);
    });

    test('Product with multiple colors', () {
      const product = Product(
        id: '5',
        title: 'Multi-color Item',
        price: 19.99,
        imageUrl: 'https://example.com/item.jpg',
        collectionId: 'clothing',
        colors: ['Black', 'White', 'Navy', 'Red', 'Green'],
      );

      expect(product.colors.length, 5);
      expect(product.colors.contains('Black'), true);
      expect(product.colors.contains('Green'), true);
    });
  });
}
