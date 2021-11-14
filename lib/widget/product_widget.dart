import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart.dart';
import 'package:shopapp/provider/product.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product _prod = Provider.of(context);
    return GridTile(
      child: Image.network(
        _prod.imgUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black26,
        leading: IconButton(
          onPressed: () {
            Provider.of<CartItems>(context, listen: false).addItem(
              _prod.id,
              _prod.title,
              _prod.price,
            );
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${_prod.title} add to cart'),
                action: SnackBarAction(
                  onPressed: () =>
                      Provider.of<CartItems>(context, listen: false)
                          .decreaseQty(_prod.id),
                  label: 'UNDO',
                ),
              ),
            );
          },
          icon: const Icon(Icons.add_shopping_cart),
        ),
        title: Center(child: Text(_prod.title)),
        trailing: IconButton(
          onPressed: () {
            Provider.of<Products>(context, listen: false).toggleFav(_prod.id);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _prod.isFav
                      ? '${_prod.title} add to favorites'
                      : '${_prod.title} removed from favorites',
                ),
              ),
            );
          },
          icon: _prod.isFav
              ? const Icon(Icons.favorite, color: Colors.redAccent)
              : const Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}
