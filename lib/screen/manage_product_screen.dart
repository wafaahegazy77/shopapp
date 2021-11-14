import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/product.dart';
import 'package:shopapp/widget/drawer_item.dart';
import 'package:shopapp/widget/manage_product_item.dart';

import 'add_product_screen.dart';

class ManageProductScreen extends StatefulWidget {
  const ManageProductScreen({Key? key}) : super(key: key);
  static const routeName = '/manage_products_screen';
  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  @override
  Widget build(BuildContext context) {
    // List<Product> _selectedProd = [];
    // List<Product> _prods = [];
    var _prods = Provider.of<Products>(context).prods;

    return Scaffold(
      drawer: const DrawerItem(),
      appBar: AppBar(
        title: const Text('Manage Products'),
      ),
      body: ListView.separated(
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: _prods[i],
          child: const ManageProductItem(),
        ),
        itemCount: _prods.length,
        separatorBuilder: (ctx, i) => const Divider(
          thickness: 1.5,
          height: 1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AddProductScreen.routeName),
        // =>            Navigator.pushNamed(context, AddProductScreen.routeName),
        child: const Icon(Icons.add),
      ),
    );
  }
}
