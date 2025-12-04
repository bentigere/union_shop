import 'package:union_shop/models/product_model.dart';

class ProductService {
  // Mock database of products
  final List<Product> _allProducts = [
    const Product(
      id: '1',
      title: 'University Hoodie - Navy',
      price: 29.99,
      imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=800&h=1000&fit=crop',
      collectionId: 'clothing',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: ['Navy'],
    ),
    const Product(
      id: '2',
      title: 'University T-Shirt - White',
      price: 14.99,
      imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800&h=1000&fit=crop',
      collectionId: 'clothing',
      sizes: ['S', 'M', 'L'],
      colors: ['White'],
    ),
    const Product(
      id: '3',
      title: 'Varsity Jacket',
      price: 45.00,
      imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=800&h=1000&fit=crop',
      collectionId: 'clothing',
      sizes: ['M', 'L', 'XL'],
      colors: ['Black', 'Red'],
      originalPrice: 55.00,
    ),
    const Product(
      id: '4',
      title: 'A5 Notebook',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1517842645767-c639042777db?w=800&h=1000&fit=crop',
      collectionId: 'stationery',
      colors: ['Blue', 'Red'],
    ),
    const Product(
      id: '5',
      title: 'Metal Water Bottle',
      price: 12.50,
      imageUrl: 'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=800&h=1000&fit=crop',
      collectionId: 'accessories',
      colors: ['Silver', 'Black'],
    ),
    const Product(
      id: '6',
      title: 'Graduation Bear',
      price: 19.99,
      imageUrl: 'https://images.unsplash.com/photo-1563453392212-326f5e854473?w=800&h=1000&fit=crop',
      collectionId: 'gifts',
    ),
    const Product(
      id: '7',
      title: 'Sports Cap',
      price: 15.00,
      imageUrl: 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=800&h=1000&fit=crop',
      collectionId: 'clothing',
      sizes: ['One Size'],
      colors: ['Black', 'Navy'],
    ),
    const Product(
      id: '8',
      title: 'Canvas Tote Bag',
      price: 8.99,
      imageUrl: 'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=800&h=1000&fit=crop',
      collectionId: 'accessories',
      colors: ['Natural'],
    ),
    const Product(
      id: '9',
      title: 'Basic Tee - Black',
      price: 9.99,
      imageUrl: 'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?w=800&h=1000&fit=crop',
      collectionId: 'clothing',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: ['Black'],
    ),
    const Product(
      id: '10',
      title: 'Premium Hoodie',
      price: 55.00,
      imageUrl: 'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=800&h=1000&fit=crop',
      collectionId: 'clothing',
      sizes: ['M', 'L'],
      colors: ['Grey'],
    ),
    const Product(
      id: '11',
      title: 'Union Socks',
      price: 5.00,
      imageUrl: 'https://images.unsplash.com/photo-1586350977771-b3b0abd50c82?w=800&h=1000&fit=crop',
      collectionId: 'clothing',
      sizes: ['One Size'],
      colors: ['White'],
    ),
  ];

  List<Product> getProducts({
    String? collectionId,
    String? sortBy,
    String? filterSize,
    String? filterColor,
  }) {
    List<Product> filtered = List.from(_allProducts);

    // Filter by Collection
    if (collectionId != null && collectionId.isNotEmpty) {
      // For demo purposes, if collectionId is 'clothing', we show mostly clothing
      // In a real app, this would filter strictly by ID
      if (collectionId != 'all') {
         filtered = filtered.where((p) => p.collectionId == collectionId).toList();
      }
    }

    // Filter by Size
    if (filterSize != null && filterSize != 'All') {
      filtered = filtered.where((p) => p.sizes.contains(filterSize)).toList();
    }

    // Filter by Color
    if (filterColor != null && filterColor != 'All') {
      filtered = filtered.where((p) => p.colors.contains(filterColor)).toList();
    }

    // Sort
    if (sortBy != null) {
      switch (sortBy) {
        case 'Price: Low to High':
          filtered.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'Price: High to Low':
          filtered.sort((a, b) => b.price.compareTo(a.price));
          break;
        case 'Name: A-Z':
          filtered.sort((a, b) => a.title.compareTo(b.title));
          break;
      }
    }

    return filtered;
  }

  Product? getProductById(String id) {
    try {
      return _allProducts.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Product> searchProducts(String query) {
    if (query.isEmpty) return [];
    final lowercaseQuery = query.toLowerCase();
    return _allProducts.where((p) => 
      p.title.toLowerCase().contains(lowercaseQuery)
    ).toList();
  }
}
