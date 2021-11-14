import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/order.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Order _order = Provider.of<Order>(context);
    return ListTile(
      title: Text('${_order.totalPrice}'),
      subtitle: Text('${_order.date}'),
    );
  }
}
