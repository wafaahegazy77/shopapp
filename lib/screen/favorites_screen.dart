import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/product.dart';
import 'package:shopapp/widget/product_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> _prods = Provider.of<Products>(context).favProds;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: _prods.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: _prods[i],
          child: const ProductWidget(),
        ),
      ),
    );
  }
}
