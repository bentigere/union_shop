import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/navbar.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            // Collections Content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Our Collections',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Browse through our wide range of university merchandise.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1.2,
                    children: [
                      _buildCollectionCard(
                        context,
                        'Clothing',
                        'Hoodies, T-shirts, and more',
                        Icons.checkroom,
                      ),
                      _buildCollectionCard(
                        context,
                        'Stationery',
                        'Notebooks, pens, and essentials',
                        Icons.menu_book,
                      ),
                      _buildCollectionCard(
                        context,
                        'Accessories',
                        'Bags, bottles, and gifts',
                        Icons.shopping_bag,
                      ),
                      _buildCollectionCard(
                        context,
                        'Sports',
                        'Team gear and equipment',
                        Icons.sports_basketball,
                      ),
                      _buildCollectionCard(
                        context,
                        'Homeware',
                        'Mugs, decor, and living',
                        Icons.home,
                      ),
                      _buildCollectionCard(
                        context,
                        'Clearance',
                        'Last chance to buy',
                        Icons.local_offer,
                        isHighlight: true,
                      ),
                    ],
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

  Widget _buildCollectionCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    bool isHighlight = false,
  }) {
    return Card(
      elevation: 2,
      color: isHighlight ? Colors.red[50] : Colors.white,
      child: InkWell(
        onTap: () {
          // Placeholder for navigation to specific collection
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: isHighlight ? Colors.red : const Color(0xFF4d2963),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isHighlight ? Colors.red : Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
