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
import 'package:union_shop/widgets/drawer_widget.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const UnionShopApp());
}

// Configure GoRouter for deep linking
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product/:productId',
      builder: (context, state) {
        final productId = state.pathParameters['productId'];
        return ProductPage(productId: productId);
      },
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: '/sale',
      builder: (context, state) => const SalePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/collections',
      builder: (context, state) => const CollectionsPage(),
    ),
    GoRoute(
      path: '/collections/:collectionId',
      builder: (context, state) {
        final collectionId = state.pathParameters['collectionId'];
        return CollectionProductsPage(collectionId: collectionId);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: '/print-shack',
      builder: (context, state) => const PrintShackPage(),
    ),
    GoRoute(
      path: '/print-shack-about',
      builder: (context, state) => const PrintShackAboutPage(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchPage(),
    ),
  ],
);

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      routerConfig: _router,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselSliderController _carouselController = CarouselSliderController();

  void navigateToHome(BuildContext context) {
    context.go('/');
  }

  void navigateToProduct(BuildContext context) {
    context.go('/product');
  }

  void navigateToAbout(BuildContext context) {
    context.go('/about');
  }

  void navigateToCollections(BuildContext context) {
    context.go('/collections');
  }

  // Hero carousel widget
  Widget _buildHeroCarousel(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    final List<Map<String, String>> carouselItems = [
      {
        'image': 'https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?w=1600&q=80',
        'title': 'Essential Range - Over 20% OFF!',
        'description': 'Over 20% off our Essential Range. Come and grab yours while stock lasts!',
      },
      {
        'image': 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=1600&q=80',
        'title': 'New Summer Collection',
        'description': 'Fresh styles for the season ahead. Discover the latest trends now!',
      },
      {
        'image': 'https://images.unsplash.com/photo-1445205170230-053b83016050?w=1600&q=80',
        'title': 'Premium Quality',
        'description': 'Handpicked items for the discerning shopper. Quality you can trust.',
      },
    ];

    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: screenWidth > 800 ? 500 : 400,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: carouselItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      // Background image
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(item['image']!),
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
                                  item['title']!,
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
                                  item['description']!,
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
                );
              },
            );
          }).toList(),
        ),
        // Previous button
        Positioned(
          left: 16,
          top: 0,
          bottom: 0,
          child: Center(
            child: IconButton(
              onPressed: () => _carouselController.previousPage(),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 32),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ),
        // Next button
        Positioned(
          right: 16,
          top: 0,
          bottom: 0,
          child: Center(
            child: IconButton(
              onPressed: () => _carouselController.nextPage(),
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 32),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ),
      ],
    );
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
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const NavBar(),

            // Hero Section with Carousel
            _buildHeroCarousel(context),

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
                              'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800&h=1000&fit=crop',
                          productId: '2',
                        ),
                        ProductCard(
                          title: 'Signature Hoodie',
                          price: '£32.99',
                          imageUrl:
                              'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=800&h=1000&fit=crop',
                          productId: '3',
                        ),
                        ProductCard(
                          title: 'Signature T-Shirt',
                          price: '£14.99',
                          imageUrl:
                              'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800&h=1000&fit=crop',
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




