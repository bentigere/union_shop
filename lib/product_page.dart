import 'package:flutter/material.dart';
import 'package:union_shop/models/cart_model.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/product_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? selectedSize;
  String? selectedColor;
  int quantity = 1;

  final List<String> sizes = ['Small', 'Medium', 'Large', 'X-Large'];
  final List<String> colors = ['Black', 'Navy', 'Grey', 'White'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      children: const [
                        SizedBox(
                          width: 200,
                          child: ProductCard(
                            title: 'Classic T-Shirt',
                            price: '£12.00',
                            imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          ),
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 200,
                          child: ProductCard(
                            title: 'Union Cap',
                            price: '£10.00',
                            imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          ),
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 200,
                          child: ProductCard(
                            title: 'Varsity Jacket',
                            price: '£45.00',
                            imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
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
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
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
        const Text(
          'Premium Union Hoodie',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          '£35.00',
          style: TextStyle(fontSize: 24, color: Color(0xFF4d2963), fontWeight: FontWeight.bold),
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
          'Stay warm and stylish with our Premium Union Hoodie. Made from high-quality cotton blend material, this hoodie features the official Union logo embroidered on the chest. Perfect for campus life or casual wear.',
          style: TextStyle(color: Colors.grey[700], height: 1.5),
        ),
        const SizedBox(height: 32),
        
        // Options
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Size', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: selectedSize,
                    hint: const Text('Select Size'),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    items: sizes.map((String size) {
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
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Color', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: selectedColor,
                    hint: const Text('Select Color'),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    items: colors.map((String color) {
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
                    'Premium Union Hoodie',
                    35.00,
                    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                    quantity,
                    selectedSize,
                    selectedColor,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to cart')),
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
            onPressed: () {},
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
