# Union Shop - Flutter E-Commerce Application

A fully functional e-commerce mobile application built with Flutter for the University of Portsmouth Students' Union. This app provides a seamless shopping experience for university merchandise, including clothing, stationery, accessories, and personalized items through the Print Shack feature.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-2.17+-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)
![Tests](https://img.shields.io/badge/Tests-Passing-brightgreen)
![Coverage](https://img.shields.io/badge/Coverage-70%25+-success)

## 📱 Features

### Core Functionality
- **Product Browsing**: Browse products by collections (Clothing, Stationery, Accessories, Gifts)
- **Product Details**: View detailed product information with size, color, and quantity options
- **Shopping Cart**: Add, remove, and update items with persistent cart storage
- **Search**: Real-time product search with filtering capabilities
- **Print Shack**: Personalize products with custom text, fonts, and colors
- **User Authentication**: Register and login with email validation (Gmail/Hotmail only)
- **Responsive Design**: Adaptive layout for mobile and tablet devices

### Additional Features
- **Sale Section**: Browse discounted items
- **Navigation Drawer**: Easy access to all app sections
- **Product Reviews**: View customer reviews and ratings
- **Related Products**: Discover similar items
- **Footer Links**: Quick access to support, policies, and social media

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:
- **Flutter SDK** (3.0 or higher) - [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (2.17 or higher) - Included with Flutter
- **Android Studio** or **Xcode** (for iOS development)
- **Git** - [Install Git](https://git-scm.com/downloads)
- **VS Code** or **Android Studio** (recommended IDEs)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/bentigere/union_shop.git
   cd union_shop
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify Flutter installation**
   ```bash
   flutter doctor
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

   For specific platforms:
   ```bash
   # Run on Chrome (Web)
   flutter run -d chrome

   # Run on connected device
   flutter devices
   flutter run -d <device-id>
   ```

## 🧪 Running Tests

This project includes comprehensive unit, widget, and integration tests with **70%+ code coverage**.

### Run all tests
```bash
flutter test
```

### Run tests with coverage
```bash
flutter test --coverage
```

### Generate HTML coverage report
```bash
# Install lcov (macOS)
brew install lcov

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open in browser
open coverage/html/index.html
```

### Run specific test files
```bash
# Unit tests only
flutter test test/unit/

# Widget tests only
flutter test test/widgets/

# Page tests only
flutter test test/pages/
```

### Test Coverage Breakdown
- **Models**: 100% coverage
- **Services**: 95%+ coverage
- **Widgets**: 80%+ coverage
- **Pages**: 70%+ coverage
- **Total**: 70-75% coverage

## 📂 Project Structure

```
lib/
├── main.dart                          # App entry point
├── models/                            # Data models
│   ├── cart_model.dart               # Shopping cart logic
│   ├── product_model.dart            # Product data structure
│   └── collection_model.dart         # Collection data structure
├── services/                          # Business logic
│   ├── product_service.dart          # Product data management
│   └── collection_service.dart       # Collection data management
├── widgets/                           # Reusable UI components
│   ├── navbar.dart                   # Top navigation bar
│   ├── footer.dart                   # Bottom footer
│   ├── product_card.dart             # Product display card
│   └── drawer_widget.dart            # Side navigation drawer
├── about_page.dart                    # About page
├── cart_page.dart                     # Shopping cart page
├── collection_products_page.dart      # Collection products listing
├── collections_page.dart              # Collections overview
├── login_page.dart                    # User login
├── print_shack_about_page.dart        # Print Shack information
├── print_shack_page.dart              # Product personalization
├── product_page.dart                  # Product details
├── register_page.dart                 # User registration
├── sale_page.dart                     # Sale items
└── search_page.dart                   # Product search

test/
├── unit/                              # Unit tests
│   ├── models/                        # Model tests
│   └── services/                      # Service tests
├── widgets/                           # Widget tests
├── pages/                             # Page tests
├── integration/                       # Integration tests
└── test_helpers/                      # Test utilities
    ├── mock_data.dart                # Mock test data
    └── test_utils.dart               # Test helper functions

assets/
└── images/                            # Image assets

android/                               # Android-specific files
ios/                                   # iOS-specific files
web/                                   # Web-specific files
```

## 🛠️ Technologies & Packages

### Core Technologies
- **Flutter** - UI framework
- **Dart** - Programming language

### Key Dependencies
- `shared_preferences: ^2.5.3` - Local data persistence
- `cupertino_icons: ^1.0.0` - iOS-style icons

### Development Dependencies
- `flutter_test` - Testing framework
- `flutter_lints: ^2.0.0` - Code quality rules
- `network_image_mock: ^2.1.1` - Network image mocking for tests
- `mocktail: ^1.0.0` - Mocking library for tests

## 💡 Usage

### Shopping Flow
1. **Browse Products**: Start from the home page and explore collections
2. **View Details**: Tap any product to see detailed information
3. **Customize**: Select size, color, and quantity
4. **Add to Cart**: Click "Add to Cart" button
5. **Review Cart**: Access cart from the navigation bar
6. **Checkout**: Proceed to checkout (placeholder functionality)

### Print Shack
1. Navigate to **Print Shack** from the drawer menu
2. Select a product (T-Shirt, Hoodie, or Tote Bag)
3. Choose number of text lines
4. Enter custom text
5. Select font style and color
6. Preview your design
7. Add to cart

### Search
1. Open the search page from the navigation drawer
2. Type product name in the search field
3. Results appear automatically as you type
4. Tap any product to view details

## 🎨 Features Showcase

### Key Highlights
- **Persistent Shopping Cart**: Items are saved locally and persist across app sessions
- **Email Validation**: Only Gmail and Hotmail addresses are accepted for registration
- **Responsive Layout**: Adapts to different screen sizes
- **Real-time Search**: Instant product search results
- **Product Filtering**: Filter by size, color, and price
- **Custom Personalization**: Create unique designs with Print Shack
- **Auto-hide Notifications**: Success messages disappear after 5 seconds

## 🐛 Known Issues & Limitations

### Current Limitations
- Checkout process is a placeholder (payment integration not implemented)
- User authentication is simulated (no backend connection)
- Product data is hardcoded (no API integration)
- Network connectivity not required (offline-first design)

### Future Improvements
- [ ] Backend API integration
- [ ] Real payment processing
- [ ] User profile management
- [ ] Order history tracking
- [ ] Push notifications
- [ ] Product reviews submission
- [ ] Wishlist functionality
- [ ] Multi-language support

## 🧑‍💻 Development

### Code Style
This project follows the official Dart style guide and uses `flutter_lints` for code quality enforcement.

### Running in Development
```bash
# Hot reload enabled
flutter run

# Debug mode with verbose logging
flutter run -v

# Release mode
flutter run --release
```

### Building for Production
```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 📊 Test Results

The application includes comprehensive testing with the following coverage:

- **Unit Tests**: 54 tests covering models and services
- **Widget Tests**: 16 tests covering UI components
- **Page Tests**: 33 tests covering all major pages
- **Integration Tests**: 4 tests covering user flows

**Total: ~100+ tests** ensuring reliability and code quality.

## 📄 License

This project is created for educational purposes as part of the University of Portsmouth coursework.

## 👤 Contact

**Ben Tigere**
- GitHub: [@bentigere](https://github.com/bentigere)
- Repository: [union_shop](https://github.com/bentigere/union_shop)

## 🙏 Acknowledgments

- University of Portsmouth Students' Union for the original design inspiration
- Flutter team for the excellent framework and documentation
- Course instructors for guidance and support

---

**Note**: This is a student project created for educational purposes. It is not affiliated with or endorsed by the University of Portsmouth Students' Union.
