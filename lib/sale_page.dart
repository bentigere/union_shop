import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/product_card.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            // Promotional Banner
            Container(
              width: double.infinity,
              color: Colors.redAccent,
              padding: const EdgeInsets.all(24),
              child: const Column(
                children: [
                  Text(
                    'CLEARANCE SALE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'UP TO 50% OFF SELECTED ITEMS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Grab your essentials before they are gone! Limited stock available.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Sale Products Grid
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                children: const [
                  ProductCard(
                    title: 'Essential Zip Hoodie - Grey',
                    price: '£14.99',
                    originalPrice: '£24.99',
                    imageUrl:
                        'https://images.unsplash.com/photo-1578587018452-892bacefd3f2?w=800&h=1000&fit=crop',
                    productId: '31',
                  ),
                  ProductCard(
                    title: 'Essential T-Shirt - White',
                    price: '£6.99',
                    originalPrice: '£12.99',
                    imageUrl:
                        'https://images.unsplash.com/photo-1622445275463-afa2ab738c34?w=800&h=1000&fit=crop',
                    productId: '32',
                  ),
                  ProductCard(
                    title: 'University Cap',
                    price: '£8.99',
                    originalPrice: '£15.00',
                    imageUrl:
                        'https://images.unsplash.com/photo-1589487391730-58f20eb2c308?w=800&h=1000&fit=crop',
                    productId: '33',
                  ),
                  ProductCard(
                    title: 'A5 Notebook',
                    price: '£3.50',
                    originalPrice: '£4.99',
                    imageUrl:
                        'https://images.unsplash.com/photo-1517842645767-c639042777db?w=800&h=1000&fit=crop',
                    productId: '4',
                  ),
                  ProductCard(
                    title: 'Metal Water Bottle',
                    price: '£9.99',
                    originalPrice: '£12.50',
                    imageUrl:
                        'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=800&h=1000&fit=crop',
                    productId: '5',
                  ),
                  ProductCard(
                    title: 'Canvas Tote Bag',
                    price: '£6.99',
                    originalPrice: '£8.99',
                    imageUrl:
                        'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=800&h=1000&fit=crop',
                    productId: '8',
                  ),
                ],
              ),
            ),

            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}
