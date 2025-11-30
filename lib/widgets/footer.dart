import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xFF2c2c2c),
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 768;
              return Wrap(
                spacing: 48,
                runSpacing: 32,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  // About Us Section
                  SizedBox(
                    width: isWide ? 250 : double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ABOUT US',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Union Shop is your one-stop destination for student essentials, university merchandise, and exclusive collections.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/about');
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF4d2963),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text(
                            'Learn More →',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Opening Hours Section
                  SizedBox(
                    width: isWide ? 250 : double.infinity,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OPENING HOURS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 16),
                        FooterInfoRow(label: 'Monday - Friday', value: '9:00 AM - 6:00 PM'),
                        SizedBox(height: 8),
                        FooterInfoRow(label: 'Saturday', value: '10:00 AM - 5:00 PM'),
                        SizedBox(height: 8),
                        FooterInfoRow(label: 'Sunday', value: '11:00 AM - 4:00 PM'),
                        SizedBox(height: 16),
                        Text(
                          'Extended hours during term time!',
                          style: TextStyle(
                            color: Color(0xFF4d2963),
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Contact Information Section
                  SizedBox(
                    width: isWide ? 250 : double.infinity,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CONTACT INFO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 16),
                        FooterContactRow(icon: Icons.location_on, text: 'University House, Winston Churchill Ave, Portsmouth PO1 2UP'),
                        SizedBox(height: 12),
                        FooterContactRow(icon: Icons.phone, text: '+44 (0)23 9284 3000'),
                        SizedBox(height: 12),
                        FooterContactRow(icon: Icons.email, text: 'shop@upsu.net'),
                        SizedBox(height: 16),
                        Text(
                          'Follow us on social media for exclusive offers!',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        // Copyright Bar
        Container(
          width: double.infinity,
          color: const Color(0xFF1a1a1a),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Text(
            '© ${DateTime.now().year} Union Shop. All rights reserved.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

// Footer Helper Widgets
class FooterInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const FooterInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class FooterContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const FooterContactRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: const Color(0xFF4d2963),
          size: 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
