import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/navbar.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            // Hero Section
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                image: DecorationImage(
                  image: const NetworkImage(
                    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.6),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'THE PRINT SHACK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Customise Your Union Gear',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        context.go('/print-shack');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        'START PERSONALISING',
                        style: TextStyle(fontSize: 16, letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Info Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              child: Column(
                children: [
                  const Text(
                    'HOW IT WORKS',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 48),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 800) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _buildSteps(),
                        );
                      } else {
                        return Column(
                          children: _buildSteps()
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 32),
                                    child: e,
                                  ))
                              .toList(),
                        );
                      }
                    },
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

  List<Widget> _buildSteps() {
    return [
      _buildStepCard(
        Icons.checkroom,
        '1. Choose Product',
        'Select from our range of high-quality hoodies, t-shirts, and accessories.',
      ),
      _buildStepCard(
        Icons.edit,
        '2. Customise',
        'Add your name, society, or custom message. Choose your fonts and colors.',
      ),
      _buildStepCard(
        Icons.shopping_bag,
        '3. Order',
        'Place your order and collect it from the Union Shop within 48 hours.',
      ),
    ];
  }

  Widget _buildStepCard(IconData icon, String title, String description) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF4d2963).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 48, color: const Color(0xFF4d2963)),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], height: 1.5),
          ),
        ],
      ),
    );
  }
}
