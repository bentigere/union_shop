class Product {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String collectionId;
  final List<String> sizes;
  final List<String> colors;
  final double? originalPrice;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.collectionId,
    this.sizes = const [],
    this.colors = const [],
    this.originalPrice,
  });
}
