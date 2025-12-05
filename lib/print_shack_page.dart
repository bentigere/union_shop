import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/navbar.dart';

class PrintShackPage extends StatefulWidget {
  const PrintShackPage({super.key});

  @override
  State<PrintShackPage> createState() => _PrintShackPageState();
}

class _PrintShackPageState extends State<PrintShackPage> {
  String _selectedProduct = 'T-Shirt';
  final List<TextEditingController> _controllers = List.generate(5, (_) => TextEditingController());
  int _selectedLines = 1;
  String _selectedFont = 'Roboto';
  String _selectedColorName = 'Black';
  Color _selectedColor = Colors.black;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  final Map<String, double> _basePrices = {
    'T-Shirt': 15.00,
    'Hoodie': 35.00,
    'Mug': 10.00,
    'Tote Bag': 12.00,
  };

  final List<String> _fonts = ['Roboto', 'Serif', 'Monospace', 'Cursive'];

  final Map<String, Color> _colors = {
    'Black': Colors.black,
    'White': Colors.white,
    'Navy': const Color(0xFF000080),
    'Red': Colors.red,
    'Purple': const Color(0xFF4d2963),
    'Green': Colors.green,
  };

  @override
  Widget build(BuildContext context) {
    double price = _basePrices[_selectedProduct] ?? 0.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PERSONALISE YOUR ITEM',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create something unique.',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  const SizedBox(height: 40),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 900) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildForm(price)),
                            const SizedBox(width: 60),
                            Expanded(child: _buildPreview()),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            _buildPreview(),
                            const SizedBox(height: 40),
                            _buildForm(price),
                          ],
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

  Widget _buildForm(double price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Selection
        _buildDropdown(
          'Select Product',
          _selectedProduct,
          _basePrices.keys.toList(),
          (val) => setState(() => _selectedProduct = val!),
        ),
        const SizedBox(height: 24),

        // Number of Lines Selection
        _buildDropdown(
          'Number of Lines',
          _selectedLines.toString(),
          ['1', '2', '3', '4', '5'],
          (val) => setState(() => _selectedLines = int.parse(val!)),
        ),
        const SizedBox(height: 24),

        // Text Input
        const Text('Custom Text', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...List.generate(_selectedLines, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: TextField(
              controller: _controllers[index],
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Line ${index + 1}',
                helperText: 'Max 20 characters',
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              maxLength: 20,
              onChanged: (_) => setState(() {}),
            ),
          );
        }),
        const SizedBox(height: 4),

        // Font Selection
        _buildDropdown(
          'Font Style',
          _selectedFont,
          _fonts,
          (val) => setState(() => _selectedFont = val!),
        ),
        const SizedBox(height: 24),

        // Color Selection
        const Text('Text Color', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _colors.entries.map((entry) {
            final isSelected = _selectedColorName == entry.key;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColorName = entry.key;
                  _selectedColor = entry.value;
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: entry.value,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey[300]!,
                    width: isSelected ? 3 : 1,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.blue.withValues(alpha: 0.3),
                            blurRadius: 8,
                            spreadRadius: 2,
                          )
                        ]
                      : null,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 40),

        // Price and Action
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Price:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('£${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4d2963))),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Added personalised $_selectedProduct to cart!'),
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'VIEW CART',
                          onPressed: () {
                            context.go('/cart');
                          },
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4d2963),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'ADD TO CART',
                    style: TextStyle(fontSize: 16, letterSpacing: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPreview() {
    return Column(
      children: [
        const Text('PREVIEW',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 1)),
        const SizedBox(height: 16),
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Product Icon/Placeholder
              Icon(
                _getProductIcon(),
                size: 200,
                color: Colors.grey[300],
              ),
              // Text Overlay
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _controllers.take(_selectedLines).every((c) => c.text.isEmpty)
                      ? 'Your Text'
                      : _controllers.take(_selectedLines).map((c) => c.text).join('\n'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: _getFontFamily(),
                    fontSize: 32,
                    color: _selectedColor,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      if (_selectedColor == Colors.white)
                        const Shadow(
                          blurRadius: 2,
                          color: Colors.black,
                          offset: Offset(1, 1),
                        )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Text(
                    '$_selectedProduct • $_selectedColorName • $_selectedFont',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  IconData _getProductIcon() {
    switch (_selectedProduct) {
      case 'Mug':
        return Icons.coffee;
      case 'Tote Bag':
        return Icons.shopping_bag;
      case 'Hoodie':
        return Icons.checkroom; // Placeholder for hoodie
      default:
        return Icons.checkroom;
    }
  }

  String? _getFontFamily() {
    // In a real app, you'd load these fonts in pubspec.yaml
    // For now, we rely on system fallbacks or default
    switch (_selectedFont) {
      case 'Serif':
        return 'Times New Roman';
      case 'Monospace':
        return 'Courier';
      case 'Cursive':
        return 'Brush Script MT';
      default:
        return null; // Default system font (Roboto-like)
    }
  }
}
