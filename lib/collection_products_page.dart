import 'package:flutter/material.dart';
import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/product_card.dart';

class CollectionProductsPage extends StatefulWidget {
  const CollectionProductsPage({super.key});

  @override
  State<CollectionProductsPage> createState() => _CollectionProductsPageState();
}

class _CollectionProductsPageState extends State<CollectionProductsPage> {
  final ProductService _productService = ProductService();
  
  // State variables
  List<Product> _products = [];
  String _selectedSort = 'Featured';
  String _selectedSize = 'All';
  String _selectedColor = 'All';
  bool _isLoading = true;
  
  // Pagination state
  int _itemsToShow = 6;
  final int _itemsPerPage = 6;

  final List<String> _sortOptions = [
    'Featured',
    'Price: Low to High',
    'Price: High to Low',
    'Name: A-Z'
  ];

  final List<String> _sizeOptions = ['All', 'S', 'M', 'L', 'XL'];
  final List<String> _colorOptions = ['All', 'Black', 'White', 'Navy', 'Red'];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    Future.delayed(const Duration(milliseconds: 500), () {
      final products = _productService.getProducts(
        collectionId: 'clothing', // Defaulting to clothing for this demo
        sortBy: _selectedSort,
        filterSize: _selectedSize,
        filterColor: _selectedColor,
      );

      setState(() {
        _products = products;
        _isLoading = false;
        // Reset pagination when filters change
        _itemsToShow = _itemsPerPage; 
      });
    });
  }

  void _loadMore() {
    setState(() {
      _itemsToShow += _itemsPerPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate visible products based on pagination
    final visibleProducts = _products.take(_itemsToShow).toList();
    final hasMore = _itemsToShow < _products.length;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            
            // Header
            Container(
              width: double.infinity,
              color: Colors.grey[100],
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Column(
                children: [
                  const Text(
                    'CLOTHING',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_products.length} Products',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            // Filters & Sorting Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Filters
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildDropdown(
                        'Size',
                        _selectedSize,
                        _sizeOptions,
                        (val) {
                          setState(() => _selectedSize = val!);
                          _loadProducts();
                        },
                      ),
                      const SizedBox(width: 16),
                      _buildDropdown(
                        'Color',
                        _selectedColor,
                        _colorOptions,
                        (val) {
                          setState(() => _selectedColor = val!);
                          _loadProducts();
                        },
                      ),
                    ],
                  ),
                  
                  // Sort
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Sort by: '),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _selectedSort,
                        underline: Container(),
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        items: _sortOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() => _selectedSort = newValue);
                            _loadProducts();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Product Grid
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : visibleProducts.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Text('No products found matching your filters.'),
                          ),
                        )
                      : Column(
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: MediaQuery.of(context).size.width > 1200
                                    ? 4
                                    : MediaQuery.of(context).size.width > 800
                                        ? 3
                                        : MediaQuery.of(context).size.width > 600
                                            ? 2
                                            : 1,
                                crossAxisSpacing: 24,
                                mainAxisSpacing: 48,
                                childAspectRatio: 0.7,
                              ),
                              itemCount: visibleProducts.length,
                              itemBuilder: (context, index) {
                                final product = visibleProducts[index];
                                return ProductCard(
                                  title: product.title,
                                  price: '£${product.price.toStringAsFixed(2)}',
                                  imageUrl: product.imageUrl,
                                  originalPrice: product.originalPrice != null
                                      ? '£${product.originalPrice!.toStringAsFixed(2)}'
                                      : null,
                                  productId: product.id,
                                );
                              },
                            ),
                            
                            // Pagination / Load More
                            if (hasMore)
                              Padding(
                                padding: const EdgeInsets.only(top: 48.0),
                                child: OutlinedButton(
                                  onPressed: _loadMore,
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 48, vertical: 16),
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                  child: const Text(
                                    'LOAD MORE',
                                    style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
            ),

            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String currentValue,
    List<String> options,
    ValueChanged<String?> onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentValue,
          hint: Text(label),
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value == 'All' ? '$label: All' : value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
