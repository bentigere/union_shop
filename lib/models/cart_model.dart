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
}

class Cart extends ChangeNotifier {
  static final Cart _instance = Cart._internal();
  factory Cart() => _instance;
  Cart._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalAmount => _items.fold(0, (sum, item) => sum + item.total);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

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
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    if (quantity <= 0) {
      removeItem(item);
    } else {
      item.quantity = quantity;
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

// Simple ChangeNotifier implementation since we don't have provider package
// and we want to listen to changes.
abstract class ChangeNotifier {
  final List<Function> _listeners = [];

  void addListener(Function listener) {
    _listeners.add(listener);
  }

  void removeListener(Function listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }
}
