import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/product_card.dart';

class CollectionProductsPage extends StatelessWidget {
  final String collectionName;

  const CollectionProductsPage({super.key, this.collectionName = 'Clothing'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            // Collection Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              width: double.infinity,
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    collectionName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Explore our latest collection',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Filters and Sorting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Filter Button (Dummy)
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list),
                    label: const Text('Filter'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  // Sort Dropdown (Dummy)
                  _buildDropdown('Sort by: Featured', ['Featured', 'Price: Low to High', 'Price: High to Low', 'Newest']),
                  // Size Dropdown (Dummy)
                  _buildDropdown('Size', ['Size', 'S', 'M', 'L', 'XL']),
                  // Color Dropdown (Dummy)
                  _buildDropdown('Color', ['Color', 'Black', 'White', 'Navy', 'Grey']),
                ],
              ),
            ),
            const Divider(height: 1),
            // Product Grid
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 900
                    ? 4
                    : (MediaQuery.of(context).size.width > 600 ? 3 : 2),
                crossAxisSpacing: 24,
                mainAxisSpacing: 48,
                childAspectRatio: 0.7,
                children: const [
                  ProductCard(
                    title: 'University Hoodie - Navy',
                    price: '£29.99',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  ),
                  ProductCard(
                    title: 'Classic T-Shirt - White',
                    price: '£12.99',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  ),
                  ProductCard(
                    title: 'Varsity Jacket',
                    price: '£45.00',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  ),
                  ProductCard(
                    title: 'Beanie - Purple',
                    price: '£10.00',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  ),
                  ProductCard(
                    title: 'Joggers - Grey',
                    price: '£24.99',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  ),
                  ProductCard(
                    title: 'Sports Cap',
                    price: '£15.00',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  ),
                  ProductCard(
                    title: 'Backpack',
                    price: '£22.00',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  ),
                  ProductCard(
                    title: 'Scarf',
                    price: '£12.00',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
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

  Widget _buildDropdown(String value, List<String> items) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: items.contains(value) ? value : items.first,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: const TextStyle(fontSize: 14)),
            );
          }).toList(),
          onChanged: (_) {},
          icon: const Icon(Icons.keyboard_arrow_down, size: 20),
        ),
      ),
    );
  }
}
