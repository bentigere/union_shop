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
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                    productId: '5',
                  ),
                  ProductCard(
                    title: 'Essential T-Shirt - White',
                    price: '£6.99',
                    originalPrice: '£12.99',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                    productId: '6',
                  ),
                  ProductCard(
                    title: 'University Mug',
                    price: '£4.99',
                    originalPrice: '£8.99',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                    productId: '7',
                  ),
                  ProductCard(
                    title: 'Notebook A4',
                    price: '£2.50',
                    originalPrice: '£5.00',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                    productId: '8',
                  ),
                  ProductCard(
                    title: 'Sports Water Bottle',
                    price: '£5.99',
                    originalPrice: '£10.99',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  ),
                  ProductCard(
                    title: 'Beanie Hat',
                    price: '£8.00',
                    originalPrice: '£15.00',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
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
