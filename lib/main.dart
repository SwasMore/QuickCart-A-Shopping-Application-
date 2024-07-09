// ignore_for_file: prefer_const_constructors

//import 'dart:js';

import 'package:flutter/material.dart';
//import 'package:flutter_application_2/providers/product.dart';
//import 'package:flutter_application_2/providers/orders.dart';
import 'package:flutter_application_2/screens/cart_screen.dart';
import './screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/auth.dart';
//import './cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './providers/orders.dart';
//import './providers/products.dart';
import './screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products('', []),
          update: (ctx, auth, previousProducts) => Products(auth.token ?? '',
              previousProducts == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (ctx) => Orders('', []),
          update: (ctx, auth, previousOrders) => Orders(auth.token ?? '',
              previousOrders == null ? [] : previousOrders.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QuickCart',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            hintColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth ? ProductsOverviewScreen() : AuthScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            '/cart_screen': (BuildContext context) => const CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}
