import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/models/cart_model.dart';
import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/product_card.dart';

class ProductPage extends StatefulWidget {
  final String? productId;
  
  const ProductPage({super.key, this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductService _productService = ProductService();
  Product? _product;
  bool _isLoading = true;

  String? selectedSize;
  String? selectedColor;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  @override
  void didUpdateWidget(ProductPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.productId != widget.productId) {
      _loadProduct();
    }
  }

  void _loadProduct() {
    if (widget.productId != null) {
      final product = _productService.getProductById(widget.productId!);
      setState(() {
        _product = product;
        _isLoading = false;
        quantity = 1; // Reset quantity when loading new product
        _initializeSelections();
      });
    } else {
      // Fallback - show first product
      final products = _productService.getProducts();
      setState(() {
        if (products.isNotEmpty) {
          _product = products.first;
        }
        _isLoading = false;
        quantity = 1;
        _initializeSelections();
      });
    }
  }

  void _initializeSelections() {
    if (_product != null) {
      selectedSize = _product!.sizes.isNotEmpty ? _product!.sizes.first : null;
      selectedColor = _product!.colors.isNotEmpty ? _product!.colors.first : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_product == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Product Not Found')),
        body: const Center(child: Text('Product not found')),
      );
    }

    return Scaffold(
      key: ValueKey(_product!.id), // Force rebuild when product changes
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavBar(),
            
            // Main Content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Responsive layout: Row for desktop, Column for mobile
                  if (constraints.maxWidth > 800) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildProductImage()),
                        const SizedBox(width: 48),
                        Expanded(child: _buildProductDetails()),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _buildProductImage(),
                        const SizedBox(height: 24),
                        _buildProductDetails(),
                      ],
                    );
                  }
                },
              ),
            ),

            const Divider(height: 64),

            // Reviews Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Customer Reviews',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildReviewItem('John Doe', 5, 'Great quality hoodie! Fits perfectly.'),
                  _buildReviewItem('Jane Smith', 4, 'Nice material, but shipping took a while.'),
                  _buildReviewItem('Mike Johnson', 5, 'Love the design. Highly recommended.'),
                ],
              ),
            ),

            const Divider(height: 64),

            // Related Products Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'You May Also Like',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 200,
                          child: ProductCard(
                            title: 'Classic T-Shirt',
                            price: '£14.99',
                            imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800&q=80',
                            productId: '2',
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 200,
                          child: ProductCard(
                            title: 'Union Cap',
                            price: '£15.00',
                            imageUrl: 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=800&q=80',
                            productId: '7',
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 200,
                          child: ProductCard(
                            title: 'Varsity Jacket',
                            price: '£45.00',
                            imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=800&q=80',
                            productId: '3',
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 200,
                          child: ProductCard(
                            title: 'A5 Notebook',
                            price: '£4.99',
                            imageUrl: 'https://images.unsplash.com/photo-1517842645767-c639042777db?w=800&q=80',
                            productId: '4',
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 200,
                          child: ProductCard(
                            title: 'Metal Water Bottle',
                            price: '£12.50',
                            imageUrl: 'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=800&q=80',
                            productId: '5',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 64),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          _product!.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Center(
            child: Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _product!.title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '£${_product!.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, color: Color(0xFF4d2963), fontWeight: FontWeight.bold),
            ),
            if (_product!.originalPrice != null) ...[
              const SizedBox(width: 16),
              Text(
                '£${_product!.originalPrice!.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const Icon(Icons.star_half, color: Colors.amber, size: 20),
            const SizedBox(width: 8),
            Text('(124 Reviews)', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'This high-quality ${_product!.title} is perfect for showing your university pride. Made from premium materials for comfort and durability.',
          style: TextStyle(color: Colors.grey[700], height: 1.5),
        ),
        const SizedBox(height: 32),
        
        // Options
        if (_product!.sizes.isNotEmpty || _product!.colors.isNotEmpty)
        Row(
          children: [
            if (_product!.sizes.isNotEmpty)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Size', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    initialValue: selectedSize,
                    hint: const Text('Select Size'),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    items: _product!.sizes.map((String size) {
                      return DropdownMenuItem<String>(
                        value: size,
                        child: Text(size),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSize = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (_product!.sizes.isNotEmpty && _product!.colors.isNotEmpty)
              const SizedBox(width: 16),
            if (_product!.colors.isNotEmpty)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Color', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    initialValue: selectedColor,
                    hint: const Text('Select Color'),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    items: _product!.colors.map((String color) {
                      return DropdownMenuItem<String>(
                        value: color,
                        child: Text(color),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedColor = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 32),
        
        // Actions
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (quantity > 1) setState(() => quantity--);
                    },
                  ),
                  Text('$quantity', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() => quantity++);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Cart().addItem(
                    _product!.title,
                    _product!.price,
                    _product!.imageUrl,
                    quantity,
                    selectedSize,
                    selectedColor,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added $quantity x ${_product!.title} to cart'),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'VIEW CART',
                        onPressed: () {
                          context.go('/cart');
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Add to Cart', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
               Cart().addItem(
                    _product!.title,
                    _product!.price,
                    _product!.imageUrl,
                    quantity,
                    selectedSize,
                    selectedColor,
                  );
               context.go('/cart');
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Color(0xFF4d2963), width: 2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Buy Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4d2963))),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewItem(String user, int rating, String comment) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Text(user[0], style: const TextStyle(color: Colors.black)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        size: 16,
                        color: Colors.amber,
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(comment, style: TextStyle(color: Colors.grey[700])),
          const Divider(),
        ],
      ),
    );
  }
}
