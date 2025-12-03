import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItem {
  final String title;
  final double price;
  final String imageUrl;
  int quantity;
  final String? size;
  final String? color;

  CartItem({
    required this.title,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
    this.size,
    this.color,
  });

  double get total => price * quantity;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'size': size,
      'color': color,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      title: json['title'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
      size: json['size'],
      color: json['color'],
    );
  }
}

class Cart extends ChangeNotifier {
  static final Cart _instance = Cart._internal();
  factory Cart() => _instance;
  
  Cart._internal() {
    _loadCart();
  }

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalAmount => _items.fold(0, (sum, item) => sum + item.total);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cartJson = prefs.getString('cart_items');
    if (cartJson != null) {
      final List<dynamic> decodedList = jsonDecode(cartJson);
      _items.clear();
      _items.addAll(decodedList.map((item) => CartItem.fromJson(item)).toList());
      notifyListeners();
    }
  }

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedList = jsonEncode(_items.map((item) => item.toJson()).toList());
    await prefs.setString('cart_items', encodedList);
  }

  void addItem(String title, double price, String imageUrl, int quantity, String? size, String? color) {
    // Check if item already exists with same size/color
    try {
      final existingItem = _items.firstWhere((item) => 
        item.title == title && item.size == size && item.color == color
      );
      existingItem.quantity += quantity;
    } catch (e) {
      _items.add(CartItem(
        title: title,
        price: price,
        imageUrl: imageUrl,
        quantity: quantity,
        size: size,
        color: color,
      ));
    }
    _saveCart();
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    _saveCart();
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    if (quantity <= 0) {
      removeItem(item);
    } else {
      item.quantity = quantity;
      _saveCart();
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    _saveCart();
    notifyListeners();
  }
}
