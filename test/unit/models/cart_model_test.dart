import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:union_shop/models/cart_model.dart';

void main() {
  group('CartItem Tests', () {
    test('CartItem calculates total correctly', () {
      final item = CartItem(
        title: 'Test Product',
        price: 10.0,
        imageUrl: 'test.jpg',
        quantity: 3,
      );

      expect(item.total, 30.0);
    });

    test('CartItem toJson serializes correctly', () {
      final item = CartItem(
        title: 'Test Product',
        price: 15.99,
        imageUrl: 'test.jpg',
        quantity: 2,
        size: 'M',
        color: 'Black',
      );

      final json = item.toJson();

      expect(json['title'], 'Test Product');
      expect(json['price'], 15.99);
      expect(json['quantity'], 2);
      expect(json['size'], 'M');
      expect(json['color'], 'Black');
    });

    test('CartItem fromJson deserializes correctly', () {
      final json = {
        'title': 'Test Product',
        'price': 20.0,
        'imageUrl': 'test.jpg',
        'quantity': 4,
        'size': 'L',
        'color': 'Red',
      };

      final item = CartItem.fromJson(json);

      expect(item.title, 'Test Product');
      expect(item.price, 20.0);
      expect(item.quantity, 4);
      expect(item.size, 'L');
      expect(item.color, 'Red');
    });
  });

  group('Cart Model Tests', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      // Get the singleton instance and clear it for each test
      final cart = Cart();
      cart.clear();
      await Future.delayed(const Duration(milliseconds: 10));
    });

    test('Initial cart should be empty', () {
      final cart = Cart();
      
      expect(cart.items.length, 0);
      expect(cart.totalAmount, 0.0);
      expect(cart.itemCount, 0);
    });

    test('Adding item increases count and total', () async {
      final cart = Cart();
      
      cart.addItem('Hoodie', 29.99, 'hoodie.jpg', 1, null, null);
      await Future.delayed(const Duration(milliseconds: 10));

      expect(cart.items.length, 1);
      expect(cart.itemCount, 1);
      expect(cart.totalAmount, 29.99);
    });

    test('Adding same item with same options increases quantity', () async {
      final cart = Cart();
      
      cart.addItem('Hoodie', 29.99, 'hoodie.jpg', 1, 'M', 'Black');
      await Future.delayed(const Duration(milliseconds: 10));
      cart.addItem('Hoodie', 29.99, 'hoodie.jpg', 1, 'M', 'Black');
      await Future.delayed(const Duration(milliseconds: 10));

      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 2);
      expect(cart.totalAmount, closeTo(59.98, 0.01));
    });

    test('Adding same product with different options creates separate items', () async {
      final cart = Cart();
      
      cart.addItem('Hoodie', 29.99, 'hoodie.jpg', 1, 'M', 'Black');
      await Future.delayed(const Duration(milliseconds: 10));
      cart.addItem('Hoodie', 29.99, 'hoodie.jpg', 1, 'L', 'Navy');
      await Future.delayed(const Duration(milliseconds: 10));

      expect(cart.items.length, 2);
      expect(cart.totalAmount, closeTo(59.98, 0.01));
    });

    test('Updating quantity works correctly', () async {
      final cart = Cart();
      
      cart.addItem('T-Shirt', 14.99, 'tshirt.jpg', 1, null, null);
      await Future.delayed(const Duration(milliseconds: 10));
      
      final item = cart.items.first;
      cart.updateQuantity(item, 3);
      await Future.delayed(const Duration(milliseconds: 10));

      expect(item.quantity, 3);
      expect(cart.totalAmount, closeTo(44.97, 0.01));
    });

    test('Updating quantity to 0 removes item', () async {
      final cart = Cart();
      
      cart.addItem('Mug', 9.99, 'mug.jpg', 1, null, null);
      await Future.delayed(const Duration(milliseconds: 10));
      
      final item = cart.items.first;
      cart.updateQuantity(item, 0);
      await Future.delayed(const Duration(milliseconds: 10));

      expect(cart.items.length, 0);
    });

    test('Removing item updates cart correctly', () async {
      final cart = Cart();
      
      cart.addItem('Hoodie', 29.99, 'hoodie.jpg', 1, null, null);
      await Future.delayed(const Duration(milliseconds: 10));
      cart.addItem('T-Shirt', 14.99, 'tshirt.jpg', 1, null, null);
      await Future.delayed(const Duration(milliseconds: 10));
      
      expect(cart.items.length, 2);
      
      cart.removeItem(cart.items.first);
      await Future.delayed(const Duration(milliseconds: 10));

      expect(cart.items.length, 1);
      expect(cart.totalAmount, 14.99);
    });

    test('Clear removes all items', () async {
      final cart = Cart();
      
      cart.addItem('Hoodie', 29.99, 'hoodie.jpg', 1, null, null);
      await Future.delayed(const Duration(milliseconds: 10));
      cart.addItem('T-Shirt', 14.99, 'tshirt.jpg', 1, null, null);
      await Future.delayed(const Duration(milliseconds: 10));
      cart.addItem('Mug', 9.99, 'mug.jpg', 1, null, null);
      await Future.delayed(const Duration(milliseconds: 10));

      cart.clear();
      await Future.delayed(const Duration(milliseconds: 10));

      expect(cart.items.length, 0);
      expect(cart.totalAmount, 0.0);
    });

    test('Cart persists data with SharedPreferences', () async {
      SharedPreferences.setMockInitialValues({});
      final cart = Cart();
      cart.clear();
      await Future.delayed(const Duration(milliseconds: 10));
      
      cart.addItem('Persistent Item', 19.99, 'item.jpg', 2, 'M', 'Blue');
      await Future.delayed(const Duration(milliseconds: 50));

      final prefs = await SharedPreferences.getInstance();
      final cartData = prefs.getString('cart_items');
      
      expect(cartData, isNotNull);
      expect(cartData, contains('Persistent Item'));
    });

    test('itemCount calculates total quantity correctly', () async {
      final cart = Cart();
      
      cart.addItem('Item 1', 10.0, 'item1.jpg', 2, null, null);
      await Future.delayed(const Duration(milliseconds: 10));
      cart.addItem('Item 2', 15.0, 'item2.jpg', 3, null, null);
      await Future.delayed(const Duration(milliseconds: 10));
      cart.addItem('Item 3', 20.0, 'item3.jpg', 1, null, null);
      await Future.delayed(const Duration(milliseconds: 10));

      expect(cart.itemCount, 6); // 2 + 3 + 1
    });
  });
}
