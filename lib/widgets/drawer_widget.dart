import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF4d2963),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // You can add a logo here if you want
                // Image.asset('assets/images/jordanlogo.png.jpg', height: 50),
                const SizedBox(height: 10),
                const Text(
                  'Union Shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Shop Collections'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/collections');
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.print),
            title: const Text('Print Shack'),
            children: [
              ListTile(
                title: const Text('Personalize'),
                contentPadding: const EdgeInsets.only(left: 72),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/print-shack');
                },
              ),
              ListTile(
                title: const Text('About Print Shack'),
                contentPadding: const EdgeInsets.only(left: 72),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/print-shack-about');
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title: const Text('Sale'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/sale');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/search');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cart');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Register'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/register');
            },
          ),
        ],
      ),
    );
  }
}
