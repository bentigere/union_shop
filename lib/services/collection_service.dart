import 'package:union_shop/models/collection_model.dart';

class CollectionService {
  // Simulating fetching data from a database or API
  List<Collection> getCollections() {
    return [
      const Collection(
        id: 'clothing',
        title: 'Clothing',
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
      ),
      const Collection(
        id: 'stationery',
        title: 'Stationery',
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      ),
      const Collection(
        id: 'accessories',
        title: 'Accessories',
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      ),
      const Collection(
        id: 'gifts',
        title: 'Gifts',
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      ),
      const Collection(
        id: 'sale',
        title: 'Sale Items',
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      ),
      const Collection(
        id: 'new',
        title: 'New Arrivals',
        imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      ),
    ];
  }
}
