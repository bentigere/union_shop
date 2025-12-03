import 'package:union_shop/about_page.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/collection_products_page.dart';
import "package:union_shop/collections_page.dart";
import 'package:flutter/material.dart';
import 'package:union_shop/login_page.dart';
import 'package:union_shop/print_shack_about_page.dart';
import 'package:union_shop/print_shack_page.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/register_page.dart';
import 'package:union_shop/sale_page.dart';
import 'package:union_shop/search_page.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/product_card.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutPage(),
        '/sale': (context) => const SalePage(),
        '/login': (context) => const LoginPage(),
        '/collections': (context) => const CollectionsPage(),
        '/collection-products': (context) => const CollectionProductsPage(),
        '/cart': (context) => const CartPage(),
        '/print-shack': (context) => const PrintShackPage(),
        '/print-shack-about': (context) => const PrintShackAboutPage(),
        '/search': (context) => const SearchPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void navigateToAbout(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  void navigateToCollections(BuildContext context) {
    Navigator.pushNamed(context, '/collections');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine crossAxisCount based on screen width
    int crossAxisCount = 1;
    if (screenWidth > 1200) {
      crossAxisCount = 4;
    } else if (screenWidth > 800) {
      crossAxisCount = 3;
    } else if (screenWidth > 600) {
      crossAxisCount = 2;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const NavBar(),

            // Hero Section
            SizedBox(
              height: screenWidth > 800 ? 500 : 400, // Taller hero on desktop
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Essential Range - Over 20% OFF!',
                              style: TextStyle(
                                fontSize: screenWidth > 600 ? 48 : 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "Over 20% off our Essential Range. Come and grab yours while stock lasts!",
                              style: TextStyle(
                                fontSize: screenWidth > 600 ? 24 : 18,
                                color: Colors.white,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 40),
                            ElevatedButton(
                              onPressed: () => navigateToCollections(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4d2963),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth > 600 ? 48 : 32,
                                  vertical: screenWidth > 600 ? 24 : 16,
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: Text(
                                'BROWSE COLLECTION',
                                style: TextStyle(
                                  fontSize: screenWidth > 600 ? 16 : 14,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 40.0,
                  horizontal: screenWidth > 1200
                      ? (screenWidth - 1200) / 2 + 40
                      : 24.0,
                ),
                child: Column(
                  children: [
                    Text(
                      'ESSENTIAL RANGE - OVER 20% OFF!',
                      style: TextStyle(
                        fontSize: screenWidth > 600 ? 24 : 20,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      childAspectRatio:
                          0.75, // Adjusted for better card proportions
                      children: const [
                        ProductCard(
                          title: 'Limited Edition Essential Zip Hoodies',
                          price: '£14.99',
                          imageUrl:
                              'https://ik.imagekit.io/3e62m6un2/Nike%20Dunk%20Panda%20Low%20DD1391-100/_Nike%20Dunk%20Panda%20Low%20DD1391-100._001.jpeg?updatedAt=1702045203378',
                          productId: '1',
                        ),
                        ProductCard(
                          title: 'Essential T shirt',
                          price: '£6.99',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          productId: '2',
                        ),
                        ProductCard(
                          title: 'Signature Hoodie',
                          price: '£32.99',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          productId: '3',
                        ),
                        ProductCard(
                          title: 'Signature T-Shirt',
                          price: '£14.99',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          productId: '4',
                        ),
                      ],
                    ),
                  ],
                ),
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




