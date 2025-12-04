import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/models/collection_model.dart';

class MockData {
  static List<Product> getMockProducts() {
    return [
      const Product(
        id: '1',
        title: 'Test Hoodie',
        price: 29.99,
        imageUrl: 'https://example.com/hoodie.jpg',
        collectionId: 'clothing',
        sizes: ['S', 'M', 'L'],
        colors: ['Black', 'Navy'],
      ),
      const Product(
        id: '2',
        title: 'Test T-Shirt',
        price: 14.99,
        imageUrl: 'https://example.com/tshirt.jpg',
        collectionId: 'clothing',
        sizes: ['S', 'M', 'L', 'XL'],
        colors: ['White', 'Black'],
      ),
      const Product(
        id: '3',
        title: 'Test Mug',
        price: 9.99,
        imageUrl: 'https://example.com/mug.jpg',
        collectionId: 'accessories',
        colors: ['Red', 'Blue'],
      ),
      const Product(
        id: '4',
        title: 'Test Hoodie 2',
        price: 34.99,
        originalPrice: 44.99,
        imageUrl: 'https://example.com/hoodie2.jpg',
        collectionId: 'clothing',
        sizes: ['M', 'L', 'XL'],
        colors: ['Black'],
      ),
    ];
  }

  static List<Collection> getMockCollections() {
    return [
      const Collection(
        id: 'clothing',
        title: 'Clothing',
        imageUrl: 'https://example.com/clothing.jpg',
      ),
      const Collection(
        id: 'accessories',
        title: 'Accessories',
        imageUrl: 'https://example.com/accessories.jpg',
      ),
      const Collection(
        id: 'stationery',
        title: 'Stationery',
        imageUrl: 'https://example.com/stationery.jpg',
      ),
    ];
  }
}
