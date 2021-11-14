import 'package:flutter/cupertino.dart';

class CartItem with ChangeNotifier {
  String id, title;
  double price;
  int qty;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.qty,
  });
}

class CartItems with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get itemsCount => _items.length;

  double get totalPrice {
    double total = 0;
    _items.forEach((id, prodData) {
      total += prodData.price * prodData.qty;
    });
    return total;
  }

  void addItem(String id, String title, double price) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (existItem) => CartItem(
                id: id,
                title: title,
                price: price,
                qty: existItem.qty + 1,
              ));
    } else {
      _items.addAll({
        id: CartItem(
          id: id,
          title: title,
          price: price,
          qty: 1,
        ),
      });
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void decreaseQty(String id) {
    if (_items[id]!.qty == 1) {
      _items.remove(id);
    } else {
      _items.update(
        id,
        (existItem) => CartItem(
          id: id,
          title: existItem.title,
          price: existItem.price,
          qty: existItem.qty - 1,
        ),
      );
    }
    notifyListeners();
  }
}
