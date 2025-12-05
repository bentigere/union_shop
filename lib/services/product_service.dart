import 'package:union_shop/models/product_model.dart';

class ProductService {
  // Mock database of products
  final List<Product> _allProducts = [
    // Clothing Collection
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
      id: '7',
      title: 'Sports Cap',
      price: 15.00,
      imageUrl: 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=800&h=1000&fit=crop',
      collectionId: 'clothing',
      sizes: ['One Size'],
      colors: ['Black', 'Navy'],
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
    const Product(
      id: '12',
      title: 'Polo Shirt',
      price: 22.99,
      imageUrl: 'https://images.unsplash.com/photo-1586790170083-2f9ceadc732d?w=800&h=1000&fit=crop',
      collectionId: 'clothing',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: ['Navy', 'White'],
    ),
    const Product(
      id: '13',
      title: 'Joggers',
      price: 24.99,
      imageUrl: 'https://images.unsplash.com/photo-1506629082955-511b1aa562c8?w=800&h=1000&fit=crop',
      collectionId: 'clothing',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: ['Grey', 'Black'],
    ),
    const Product(
      id: '14',
      title: 'Sweatshirt',
      price: 26.99,
      imageUrl: 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=800&h=1000&fit=crop',
      collectionId: 'clothing',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: ['Red', 'Navy'],
    ),
    
    // Stationery Collection
    const Product(
      id: '4',
      title: 'A5 Notebook',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1517842645767-c639042777db?w=800&h=1000&fit=crop',
      collectionId: 'stationery',
      colors: ['Blue', 'Red'],
    ),
    const Product(
      id: '15',
      title: 'Pen Set',
      price: 6.99,
      imageUrl: 'https://images.unsplash.com/photo-1586075010923-2dd4570fb338?w=800&h=1000&fit=crop',
      collectionId: 'stationery',
      colors: ['Black', 'Blue'],
    ),
    const Product(
      id: '16',
      title: 'Spiral Notepad',
      price: 3.99,
      imageUrl: 'https://images.unsplash.com/photo-1531346878377-a5be20888e57?w=800&h=1000&fit=crop',
      collectionId: 'stationery',
      colors: ['White'],
    ),
    const Product(
      id: '17',
      title: 'Pencil Case',
      price: 7.50,
      imageUrl: 'https://images.unsplash.com/photo-1589307357838-d9b95a84f6c7?w=800&h=1000&fit=crop',
      collectionId: 'stationery',
      colors: ['Black', 'Navy'],
    ),
    const Product(
      id: '18',
      title: 'Highlighter Set',
      price: 5.99,
      imageUrl: 'https://images.unsplash.com/photo-1609137144813-7d9921338f24?w=800&h=1000&fit=crop',
      collectionId: 'stationery',
      colors: ['Multi'],
    ),
    const Product(
      id: '19',
      title: 'A4 Folder',
      price: 4.50,
      imageUrl: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=800&h=1000&fit=crop',
      collectionId: 'stationery',
      colors: ['Blue', 'Red'],
    ),
    const Product(
      id: '20',
      title: 'Sticky Notes Pack',
      price: 3.50,
      imageUrl: 'https://images.unsplash.com/photo-1613743990133-f1c99f102826?w=800&h=1000&fit=crop',
      collectionId: 'stationery',
      colors: ['Yellow'],
    ),
    
    // Accessories Collection
    const Product(
      id: '5',
      title: 'Metal Water Bottle',
      price: 12.50,
      imageUrl: 'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=800&h=1000&fit=crop',
      collectionId: 'accessories',
      colors: ['Silver', 'Black'],
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
      id: '21',
      title: 'Backpack',
      price: 35.00,
      imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=800&h=1000&fit=crop',
      collectionId: 'accessories',
      colors: ['Black', 'Navy'],
    ),
    const Product(
      id: '22',
      title: 'Keychain',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1591348278863-b0be1e3a2f4d?w=800&h=1000&fit=crop',
      collectionId: 'accessories',
      colors: ['Silver'],
    ),
    const Product(
      id: '23',
      title: 'Phone Case',
      price: 9.99,
      imageUrl: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?w=800&h=1000&fit=crop',
      collectionId: 'accessories',
      colors: ['Clear', 'Black'],
    ),
    const Product(
      id: '24',
      title: 'Lanyard',
      price: 3.50,
      imageUrl: 'https://images.unsplash.com/photo-1582719471137-c3967ffb1c42?w=800&h=1000&fit=crop',
      collectionId: 'accessories',
      colors: ['Navy', 'Red'],
    ),
    const Product(
      id: '25',
      title: 'Umbrella',
      price: 14.99,
      imageUrl: 'https://images.unsplash.com/photo-1585314062340-f1dbde1b4623?w=800&h=1000&fit=crop',
      collectionId: 'accessories',
      colors: ['Black'],
    ),
    
    // Gifts Collection
    const Product(
      id: '6',
      title: 'Graduation Bear',
      price: 19.99,
      imageUrl: 'https://images.unsplash.com/photo-1563453392212-326f5e854473?w=800&h=1000&fit=crop',
      collectionId: 'gifts',
    ),
    const Product(
      id: '26',
      title: 'Mug Set',
      price: 12.99,
      imageUrl: 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?w=800&h=1000&fit=crop',
      collectionId: 'gifts',
      colors: ['White'],
    ),
    const Product(
      id: '27',
      title: 'Gift Card - £25',
      price: 25.00,
      imageUrl: 'https://images.unsplash.com/photo-1549465220-1a8b9238cd48?w=800&h=1000&fit=crop',
      collectionId: 'gifts',
    ),
    const Product(
      id: '28',
      title: 'Pin Badge Set',
      price: 8.50,
      imageUrl: 'https://images.unsplash.com/photo-1611085583191-a3b181a88401?w=800&h=1000&fit=crop',
      collectionId: 'gifts',
      colors: ['Multi'],
    ),
    const Product(
      id: '29',
      title: 'Desk Calendar',
      price: 7.99,
      imageUrl: 'https://images.unsplash.com/photo-1506784242126-2a0b0b89c56a?w=800&h=1000&fit=crop',
      collectionId: 'gifts',
    ),
    const Product(
      id: '30',
      title: 'Scented Candle',
      price: 11.99,
      imageUrl: 'https://images.unsplash.com/photo-1602874801006-e04b9d7b7b8c?w=800&h=1000&fit=crop',
      collectionId: 'gifts',
      colors: ['White'],
    ),
    
    // Sale Items
    const Product(
      id: '31',
      title: 'Discounted Hoodie',
      price: 19.99,
      imageUrl: 'https://images.unsplash.com/photo-1578587018452-892bacefd3f2?w=800&h=1000&fit=crop',
      collectionId: 'sale',
      sizes: ['M', 'L'],
      colors: ['Grey'],
      originalPrice: 29.99,
    ),
    const Product(
      id: '32',
      title: 'Sale T-Shirt',
      price: 7.99,
      imageUrl: 'https://images.unsplash.com/photo-1622445275463-afa2ab738c34?w=800&h=1000&fit=crop',
      collectionId: 'sale',
      sizes: ['S', 'M', 'L'],
      colors: ['Red'],
      originalPrice: 14.99,
    ),
    const Product(
      id: '33',
      title: 'Clearance Cap',
      price: 8.99,
      imageUrl: 'https://images.unsplash.com/photo-1589487391730-58f20eb2c308?w=800&h=1000&fit=crop',
      collectionId: 'sale',
      sizes: ['One Size'],
      colors: ['Black'],
      originalPrice: 15.00,
    ),
    
    // New Arrivals
    const Product(
      id: '34',
      title: 'New Quarter Zip',
      price: 32.99,
      imageUrl: 'https://images.unsplash.com/photo-1614676471928-2ed0ad1061a4?w=800&h=1000&fit=crop',
      collectionId: 'new',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: ['Navy'],
    ),
    const Product(
      id: '35',
      title: 'Latest Design Tee',
      price: 16.99,
      imageUrl: 'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=800&h=1000&fit=crop',
      collectionId: 'new',
      sizes: ['S', 'M', 'L'],
      colors: ['White', 'Black'],
    ),
    const Product(
      id: '36',
      title: 'Fresh Arrival Backpack',
      price: 39.99,
      imageUrl: 'https://images.unsplash.com/photo-1577733966973-d680bffd2e80?w=800&h=1000&fit=crop',
      collectionId: 'new',
      colors: ['Grey'],
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
