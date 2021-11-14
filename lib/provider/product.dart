import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String id, title, description, imgUrl;
  double price;
  bool isFav;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.price,
    this.isFav = false,
  });

  void toggleFav() {
    isFav = !isFav;
    notifyListeners();
  }
}

class Products with ChangeNotifier {
  final List<Product> _prods = [
    Product(
      id: '1',
      title: 'Product 1',
      description: ' this is product desc 1',
      imgUrl:
          'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      price: 135.3,
    ),
    Product(
      id: '2',
      title: 'Product 2',
      description: ' this is product desc 2',
      imgUrl:
          'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      price: 151.5,
    ),
    Product(
      id: '3',
      title: 'Product 3',
      description: ' this is product desc 3',
      imgUrl:
          'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      price: 215.2,
      isFav: true,
    ),
  ];

  List<Product> get prods => [..._prods];
  List<Product> get favProds =>
      _prods.where((element) => element.isFav).toList();

  void toggleFav(String id) {
    _prods.firstWhere((element) => element.id == id).toggleFav();
    notifyListeners();
  }

  void addProduct({
    required String title,
    required double price,
    required String description,
    required String imgUrl,
  }) {
    _prods.add(Product(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      imgUrl: imgUrl,
      price: price,
    ));
    notifyListeners();
  }

  // void updateProduct({
  //   required String title,
  //   required double price,
  //   required String description,
  //   required String imgUrl,
  // }) {
  //   notifyListeners();
  // }

  Product findById(String id) =>
      _prods.firstWhere((element) => element.id == id);

  void removeProduct(String id) {
    _prods.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
