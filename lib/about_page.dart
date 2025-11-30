import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    'About the Union Shop',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 16),

                  // Paragraph 1
                  Text(
                    'The Union Shop exists to support students by providing affordable, high-quality merchandise, essential items, and university-branded products. We aim to enhance student life with items that represent the spirit and identity of Portsmouth students.',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),

                  SizedBox(height: 16),

                  // Paragraph 2
                  Text(
                    'Our shop offers a curated range of clothing, accessories, stationery, and gifts. Many of our products are designed with students in mind and updated seasonally.',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),

                  SizedBox(height: 16),

                  // Paragraph 3
                  Text(
                    'We are committed to providing great service and supporting sustainable product choices where possible. All profits support activities run by the Students’ Union.',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),

                  SizedBox(height: 32),

                  // Optional section
                  Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Email: info@unionshop.example\n'
                    'Opening Hours: Mon–Fri, 9am–5pm',
                    style: TextStyle(fontSize: 15, height: 1.5),
                  ),
                ],
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
