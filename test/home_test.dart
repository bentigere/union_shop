import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check that basic UI elements are present
        expect(find.text('Essential Range - Over 20% OFF!'), findsOneWidget);
        expect(find.text('BROWSE COLLECTION'), findsOneWidget);
      });
    });

    testWidgets('should display product cards', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        // Check that product grid exists
        expect(find.byType(GridView), findsOneWidget);
      });
    });

    testWidgets('should display header icons', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pump();

        // Check that header icons are present
        expect(find.byIcon(Icons.search), findsWidgets);
        expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
        expect(find.byIcon(Icons.menu), findsOneWidget);
      });
    });

    testWidgets('should display footer', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        // Check that footer is present (footer uses DateTime.now().year)
        final currentYear = DateTime.now().year;
        expect(find.textContaining('© $currentYear Union Shop'), findsOneWidget);
      });
    });
  });
}

