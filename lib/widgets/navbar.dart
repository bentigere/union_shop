import 'package:flutter/material.dart';
import 'package:union_shop/models/cart_model.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top banner
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/sale');
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Text(
              'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        // Main Navigation Bar
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const DesktopNavBar();
              } else {
                return const MobileNavBar();
              }
            },
          ),
        ),
      ],
    );
  }
}

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Logo
        GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
          child: Image.asset(
            'assets/images/jordanlogo.png.jpg',
            height: 30,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported, color: Colors.grey);
            },
          ),
        ),
        const Spacer(),
        // Navigation Links
        Row(
          children: [
            _NavBarLink(title: 'Home', onTap: () => Navigator.pushNamed(context, '/')),
            _NavBarLink(title: 'Shop', onTap: () => Navigator.pushNamed(context, '/collections')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: PopupMenuButton<String>(
                tooltip: 'Print Shack',
                offset: const Offset(0, 40),
                onSelected: (value) => Navigator.pushNamed(context, value),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: '/print-shack',
                    child: Text('Personalize'),
                  ),
                  const PopupMenuItem(
                    value: '/print-shack-about',
                    child: Text('About Printshack'),
                  ),
                ],
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Print Shack',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_drop_down, color: Colors.black87, size: 20),
                    ],
                  ),
                ),
              ),
            ),
            _NavBarLink(title: 'About Us', onTap: () => Navigator.pushNamed(context, '/about')),
            _NavBarLink(title: 'Sale', onTap: () => Navigator.pushNamed(context, '/sale'), isSale: true),
            _NavBarLink(title: 'Contact', onTap: () {}), // Placeholder
          ],
        ),
        const Spacer(),
        // Icons
        const _NavBarIcons(),
      ],
    );
  }
}

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Logo
        GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
          child: Image.asset(
            'assets/images/jordanlogo.png.jpg',
            height: 24,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported, color: Colors.grey);
            },
          ),
        ),
        const Spacer(),
        // Icons including Menu
        const _NavBarIcons(isMobile: true),
      ],
    );
  }
}

class _NavBarLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSale;

  const _NavBarLink({
    required this.title,
    required this.onTap,
    this.isSale = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSale ? Colors.red : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _NavBarIcons extends StatelessWidget {
  final bool isMobile;

  const _NavBarIcons({this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.grey),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person_outline, color: Colors.grey),
          onPressed: () => Navigator.pushNamed(context, '/login'),
        ),
        ListenableBuilder(
          listenable: Cart(),
          builder: (context, child) {
            print('NavBar rebuilding. Cart count: ${Cart().itemCount}');
            return IconButton(
              icon: Badge(
                isLabelVisible: Cart().itemCount > 0,
                label: Text('${Cart().itemCount}'),
                child: const Icon(Icons.shopping_bag_outlined, color: Colors.grey),
              ),
              onPressed: () => Navigator.pushNamed(context, '/cart'),
            );
          },
        ),
        if (isMobile)
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.grey),
            onPressed: () {
              // Placeholder for menu action
            },
          ),
      ],
    );
  }
}
