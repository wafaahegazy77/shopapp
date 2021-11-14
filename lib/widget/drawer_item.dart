import 'package:flutter/material.dart';
import 'package:shopapp/screen/manage_product_screen.dart';
// Screen
// import 'package:shopapp/screen/manage_products_screen.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: const Color(0xff3c096c),
                width: double.infinity,
                height: 150,
              ),
              const Positioned(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                bottom: 15,
                left: 10,
              ),
            ],
          ),
          ListTile(
            title: const Text('Products'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          ListTile(
            title: const Text('Orders'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/orders_screen'),
          ),
          ListTile(
            title: const Text('Manage Products'),
            onTap: () => Navigator.pushReplacementNamed(
                context, ManageProductScreen.routeName),
          ),
          ListTile(
            title: const Text('Log Out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
