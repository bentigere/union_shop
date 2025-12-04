import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: ProductPage());
    }

    testWidgets('should display product page with basic elements', (
      tester,
    ) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Check that basic UI elements are present
        expect(find.text('University Hoodie - Navy'), findsOneWidget);
        expect(find.text('£29.99'), findsOneWidget);
      });
    });

    testWidgets('should display size and color options', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Check that size and color dropdowns exist
        expect(find.text('Size'), findsOneWidget);
        expect(find.text('Color'), findsOneWidget);
      });
    });

    testWidgets('should display header icons', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Check that header icons are present
        expect(find.byIcon(Icons.search), findsWidgets);
        expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
        expect(find.byIcon(Icons.menu), findsOneWidget);
      });
    });

    testWidgets('should display footer', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        // Check that footer is present
        final currentYear = DateTime.now().year;
        expect(find.textContaining('© $currentYear Union Shop'), findsOneWidget);
      });
    });

    testWidgets('should display Add to Cart button', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Check that Add to Cart button exists
        expect(find.text('Add to Cart'), findsOneWidget);
      });
    });
  });
}

