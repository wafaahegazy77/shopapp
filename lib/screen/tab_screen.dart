import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart.dart';
import 'package:shopapp/screen/cart_screen.dart';
import 'package:shopapp/screen/favorites_screen.dart';
import 'package:shopapp/screen/products_screen.dart';
import 'package:shopapp/widget/badge.dart';
import 'package:shopapp/widget/drawer_item.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  late List<Map<String, dynamic>> _pages;
  @override
  void initState() {
    _pages = [
      {
        'title': 'Products',
        'body': const ProductScreen(),
      },
      {
        'title': 'Favorites',
        'body': const FavoritesScreen(),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int count = Provider.of<CartItems>(context).itemsCount;
    return Scaffold(
      drawer: const DrawerItem(),
      appBar: AppBar(
        backgroundColor: const Color(0xff3c096c),
        title: Text(_pages[_currentIndex]['title']),
        actions: [
          Badge(
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            value: count.toString(),
          )
        ],
      ),
      body: _pages[_currentIndex]['body'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeIndex,
        backgroundColor: const Color(0xff3c096c),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
