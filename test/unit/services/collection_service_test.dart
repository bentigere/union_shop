import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/collection_service.dart';

void main() {
  group('Collection Service Tests', () {
    late CollectionService service;

    setUp(() {
      service = CollectionService();
    });

    test('getCollections returns non-empty list', () {
      final collections = service.getCollections();
      
      expect(collections, isNotEmpty);
      expect(collections.length, greaterThanOrEqualTo(5));
    });

    test('getCollections returns collections with required fields', () {
      final collections = service.getCollections();
      
      for (var collection in collections) {
        expect(collection.id, isNotEmpty);
        expect(collection.title, isNotEmpty);
        expect(collection.imageUrl, isNotEmpty);
      }
    });

    test('getCollections returns unique collection IDs', () {
      final collections = service.getCollections();
      final ids = collections.map((c) => c.id).toSet();
      
      expect(ids.length, collections.length);
    });

    test('getCollections includes expected collections', () {
      final collections = service.getCollections();
      final ids = collections.map((c) => c.id).toList();
      
      expect(ids, contains('clothing'));
      expect(ids, contains('stationery'));
      expect(ids, contains('accessories'));
      expect(ids, contains('gifts'));
    });

    test('getCollections returns consistent results', () {
      final collections1 = service.getCollections();
      final collections2 = service.getCollections();
      
      expect(collections1.length, collections2.length);
      
      for (int i = 0; i < collections1.length; i++) {
        expect(collections1[i].id, collections2[i].id);
        expect(collections1[i].title, collections2[i].title);
      }
    });

    test('Collection titles are human-readable', () {
      final collections = service.getCollections();
      
      for (var collection in collections) {
        expect(collection.title.length, greaterThan(2));
        expect(collection.title[0], equals(collection.title[0].toUpperCase()));
      }
    });

    test('All collections have valid image URLs', () {
      final collections = service.getCollections();
      
      for (var collection in collections) {
        expect(collection.imageUrl.startsWith('http'), true);
      }
    });

    test('getCollections returns at least common categories', () {
      final collections = service.getCollections();
      final ids = collections.map((c) => c.id).toList();
      
      // Check for at least these common categories
      expect(ids, anyOf(contains('clothing'), contains('accessories')));
    });
  });
}
