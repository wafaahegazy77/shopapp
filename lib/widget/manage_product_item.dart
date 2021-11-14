import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/product.dart';
import 'package:shopapp/screen/add_product_screen.dart';

class ManageProductItem extends StatelessWidget {
  const ManageProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _prod = Provider.of<Product>(context);
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.23,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_prod.imgUrl),
            radius: 30,
          ),
          title: Text(_prod.title),
          subtitle: Text('${_prod.price}'),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.black45,
          icon: Icons.edit,
          onTap: () => Navigator.of(context).pushNamed(
              AddProductScreen.routeName,
              arguments: {'id': _prod.id}),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => Provider.of<Products>(context, listen: false)
              .removeProduct(_prod.id),
        ),
      ],
    );
  }
}
