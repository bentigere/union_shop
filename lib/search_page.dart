import 'package:flutter/material.dart';
import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/services/product_service.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/product_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ProductService _productService = ProductService();
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];
  bool _hasSearched = false;

  void _performSearch(String query) {
    setState(() {
      _hasSearched = true;
      _searchResults = _productService.searchProducts(query);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            Container(
              padding: const EdgeInsets.all(24),
              constraints: const BoxConstraints(minHeight: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Search Products',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for products...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _hasSearched = false;
                            _searchResults = [];
                          });
                        },
                      ),
                    ),
                    onSubmitted: _performSearch,
                    textInputAction: TextInputAction.search,
                  ),
                  const SizedBox(height: 32),
                  if (_hasSearched) ...[
                    Text(
                      'Found ${_searchResults.length} results for "${_searchController.text}"',
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    if (_searchResults.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(48.0),
                          child: Column(
                            children: [
                              Icon(Icons.search_off, size: 64, color: Colors.grey),
                              SizedBox(height: 16),
                              Text(
                                'No products found',
                                style: TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        ),
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final product = _searchResults[index];
                          return ProductCard(
                            title: product.title,
                            price: '£${product.price.toStringAsFixed(2)}',
                            imageUrl: product.imageUrl,
                            originalPrice: product.originalPrice != null
                                ? '£${product.originalPrice!.toStringAsFixed(2)}'
                                : null,
                            productId: product.id,
                          );
                        },
                      ),
                  ],
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
