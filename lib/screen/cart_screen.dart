import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart.dart';
import 'package:shopapp/provider/order.dart';
import 'package:shopapp/widget/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, CartItem> _items = Provider.of<CartItems>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: const Color(0xff3c096c),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, i) => ChangeNotifierProvider.value(
                value: _items.values.toList()[i],
                child: CartItemWidget(_items.keys.toList()[i]),
              ),
              itemCount: _items.length,
              separatorBuilder: (_, i) => const Divider(
                thickness: 1.5,
                height: 0,
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total'),
                  Text(
                      '${Provider.of<CartItems>(context, listen: false).totalPrice}')
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Provider.of<Orders>(context, listen: false).addOrder(
                _items.values.toList(),
                Provider.of<CartItems>(context, listen: false).totalPrice,
              );
              Navigator.of(context).pushReplacementNamed('/orders_screen');
            },
            color: Colors.purple,
            minWidth: double.infinity,
            height: 50,
            child: const Text('Order'),
          )
        ],
      ),
    );
  }
}
