import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart.dart';
import 'package:shopapp/provider/order.dart';
import 'package:shopapp/provider/product.dart';
import 'package:shopapp/screen/add_product_screen.dart';
import 'package:shopapp/screen/cart_screen.dart';
import 'package:shopapp/screen/manage_product_screen.dart';
import 'package:shopapp/screen/orders_screen.dart';
import 'package:shopapp/screen/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: CartItems()),
        ChangeNotifierProvider.value(value: Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xff3c096c),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xff5e07b0)),
        ),
        routes: {
          '/': (_) => const TabScreen(),
          CartScreen.routeName: (_) => const CartScreen(),
          ManageProductScreen.routeName: (_) => const ManageProductScreen(),
          AddProductScreen.routeName: (_) => const AddProductScreen(),
          '/orders_screen': (_) => const OrdersScreen(),
        },
      ),
    );
  }
}
