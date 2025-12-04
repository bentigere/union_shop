import 'package:union_shop/models/collection_model.dart';

class CollectionService {
  // Simulating fetching data from a database or API
  List<Collection> getCollections() {
    return [
      const Collection(
        id: 'clothing',
        title: 'Clothing',
        imageUrl: 'https://images.unsplash.com/photo-1489987707025-afc232f7ea0f?w=800&h=600&fit=crop',
      ),
      const Collection(
        id: 'stationery',
        title: 'Stationery',
        imageUrl: 'https://images.unsplash.com/photo-1606326608606-aa0b62935f2b?w=800&h=600&fit=crop',
      ),
      const Collection(
        id: 'accessories',
        title: 'Accessories',
        imageUrl: 'https://images.unsplash.com/photo-1523779917675-b6ed3a42a561?w=800&h=600&fit=crop',
      ),
      const Collection(
        id: 'gifts',
        title: 'Gifts',
        imageUrl: 'https://images.unsplash.com/photo-1513885535751-8b9238bd345a?w=800&h=600&fit=crop',
      ),
      const Collection(
        id: 'sale',
        title: 'Sale Items',
        imageUrl: 'https://images.unsplash.com/photo-1607083206968-13611e3d76db?w=800&h=600&fit=crop',
      ),
      const Collection(
        id: 'new',
        title: 'New Arrivals',
        imageUrl: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800&h=600&fit=crop',
      ),
    ];
  }
}
