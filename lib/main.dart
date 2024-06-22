// ignore_for_file: prefer_const_constructors

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/orders.dart';
import 'package:flutter_application_2/screens/cart_screen.dart';
import './screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
//import './cart_screen.dart';
import './screens/orders_screen.dart';

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
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QuickCart',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          hintColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          '/cart_screen': (BuildContext context) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
