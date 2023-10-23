import 'package:flutter/cupertino.dart';
import 'package:sushi_restaurant/models/food.dart';

class Shop extends ChangeNotifier {
  // food menu
  final List<Food> _foodMenu = [
    // salmon sushi
    Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'lib/images/salmon_sushi.png',
      rating: '4.8',
      desc:
          'Salmon sushi is prized for its fresh, clean taste and is often appreciated for its rich, fatty texture and natural sweetness. The combination of the slightly vinegared rice and the melt-in-your-mouth salmon creates a harmonious balance of flavors and textures. It is a favorite choice among sushi enthusiasts and can be found in most sushi restaurants around the world.',
    ),
    // tuna
    Food(
      name: 'Tuna',
      price: '23.00',
      imagePath: 'lib/images/sushi.png',
      rating: '4.9',
      desc:
          'Tuna sushi is highly regarded for its fresh, clean taste and the quality of the tuna plays a significant role in the overall experience. It is appreciated for its delicate, buttery texture and a mild, oceanic flavor that uniquely satisfying. Tuna sushi is a favorite choice among sushi lovers and can be found in most sushi restaurants around the world, often served as both nigiri (atop rice) and sashimi (slices of raw fish without rice).',
    )
  ];

  // cart
  List<Food> _cart = [];

  // customer method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
      notifyListeners();
    }
  }

  // remove from cart
  void removeFromCart(Food foodItem) {
    _cart.remove(foodItem);
    notifyListeners();
  }
}
