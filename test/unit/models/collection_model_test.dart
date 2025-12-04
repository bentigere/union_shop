import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/collection_model.dart';

void main() {
  group('Collection Model Tests', () {
    test('Collection model initializes correctly', () {
      const collection = Collection(
        id: 'clothing',
        title: 'Clothing',
        imageUrl: 'https://example.com/clothing.jpg',
      );

      expect(collection.id, 'clothing');
      expect(collection.title, 'Clothing');
      expect(collection.imageUrl, 'https://example.com/clothing.jpg');
    });

    test('Collection with different properties', () {
      const collection = Collection(
        id: 'accessories',
        title: 'Accessories & More',
        imageUrl: 'https://example.com/accessories.jpg',
      );

      expect(collection.id, 'accessories');
      expect(collection.title, 'Accessories & More');
      expect(collection.imageUrl.isNotEmpty, true);
    });

    test('Collection equality comparison', () {
      const collection1 = Collection(
        id: 'test',
        title: 'Test Collection',
        imageUrl: 'test.jpg',
      );

      const collection2 = Collection(
        id: 'test',
        title: 'Test Collection',
        imageUrl: 'test.jpg',
      );

      expect(collection1.id, collection2.id);
      expect(collection1.title, collection2.title);
      expect(collection1.imageUrl, collection2.imageUrl);
    });

    test('Multiple collections with different IDs', () {
      const collection1 = Collection(
        id: 'clothing',
        title: 'Clothing',
        imageUrl: 'clothing.jpg',
      );

      const collection2 = Collection(
        id: 'accessories',
        title: 'Accessories',
        imageUrl: 'accessories.jpg',
      );

      expect(collection1.id != collection2.id, true);
      expect(collection1.title != collection2.title, true);
    });
  });
}
